class BotsController < ApplicationController
# encoding: utf-8
    require 'kconv'

    def new
     @q = Bot.search(params[:q])
     @bot = Bot.new
    end

    def create
     @bot = Bot.new(bot_params)
     if @bot.save
         redirect_to bots_path
     else
       render 'bots/new'
     end
    end
    
    def destroy
        @bot = Bot.find(params[:id])
        if @bot.delete
         flash[:success] = "deleted"
        end
        redirect_to root_path
    end
    
    def delete_all
        @bots = Bot.where.not(id: 1)
        @bots.delete_all
        redirect_to root_path
    end
    
    def index
      @q = Bot.search(params[:q])
      @results = @q.result(distinct: true)
    end
    
    def show
      @q = Bot.search(params[:q])
      @bot = Bot.find(params[:id])
    end
    
    def crawl
        @q = Bot.search(params[:q])
        @bot = Bot.find(params[:id])
        
        @time = Time.new.strftime("%Y-%m-%d　%H:%M")
        doc = Nokogiri::HTML(open("#{@bot.url}"))
        @crawl = doc.xpath("#{@bot.xpath}").inner_html
        begin
             connection = Mysql::connect("153.127.212.231", "miyagise_sagae", "s19930528", "miyagise_senkyo_db")
             connection.query("set character set utf8")
             connection.query("UPDATE  `se_postmeta` SET  `meta_value` =  '#{@time}<table> #{@crawl.encode("UTF-8")} </table>' WHERE  `post_id` = '#{@bot.article_id}' AND meta_key='votes';")
             connection.close
        rescue => e
             @error = e
          	 redirect_to failure_bots_path(id: @bot.id, error: @error)
        end
            
    end
    
    def if_crawl
        @q = Bot.search(params[:q])
        @bot = Bot.find(params[:id])
        @time = Time.new.strftime("%Y-%m-%d　%H:%M")
        doc = Nokogiri::HTML(open("#{@bot.url}"))#URLの指定
            
        doc.css('table').each do |crawl|
            @crawl = crawl.inner_html.encode("UTF-8")
             if @crawl.encode("UTF-8").include?(@bot.word1) && @crawl.encode("UTF-8").include?(@bot.word2) && @crawl.encode("UTF-8").include?(@bot.word3)
                 @if_crawl = crawl.inner_html.encode("UTF-8")
                    begin
                         connection = Mysql::connect("153.127.212.231", "miyagise_sagae", "s19930528", "miyagise_senkyo_db")
                         connection.query("set character set utf8")
                         connection.query("UPDATE  `se_postmeta` SET  `meta_value` =  '#{@time}<table> #{@if_crawl.encode("UTF-8")} </table>' WHERE  `post_id` = '#{@bot.article_id}' AND meta_key='votes';")
                         connection.close
                    rescue => e
                         @error = e
                      	 redirect_to failure_bots_path(id: @bot.id, error: @error)
                    end
             end
        end
    end
    
    def slice_crawl
        @q = Bot.search(params[:q])
        @bot = Bot.find(params[:id])
        @doc = Nokogiri::HTML(open("#{@bot.url}")).inner_html.encode("UTF-8")#URLの指定
        @index_doc = @doc.index("#{@bot.upper}")
        @end_doc = @doc.rindex("</html>") - 1
        @slice_crawl_pre = @doc.slice(@index_doc..@end_doc)
        @table_doc = @slice_crawl_pre.index("table>") + 5
        @slice_crawl = @slice_crawl_pre.slice(0..@table_doc)
        @time = Time.new.strftime("%Y-%m-%d　%H:%M")
        begin
             connection = Mysql::connect("153.127.212.231", "miyagise_sagae", "s19930528", "miyagise_senkyo_db")
             connection.query("set character set utf8")
             connection.query("UPDATE  `se_postmeta` SET  `meta_value` =  '#{@time}#{@slice_crawl.encode("UTF-8")}' WHERE  `post_id` = '#{@bot.article_id}' AND meta_key='votes';")
             connection.close
        rescue => e
             @error = e
          	 redirect_to failure_bots_path(id: @bot.id, error: @error)
        end
    end
    
    def test
        @q = Bot.search(params[:q])
        @bot = Bot.find(params[:id])
        @doc = Nokogiri::HTML(open("#{@bot.url}")).inner_html.encode("UTF-8")#URLの指定
    end
    
    def edit
        @q = Bot.search(params[:q])
        @bot = Bot.find(params[:id])
    end
    
    def update
        @bot = Bot.find(params[:id])
        @q = Bot.search(params[:q])
        if @bot.update(bot_params)
            redirect_to @bot
        else
            render 'bots/edit'
        end
    end
    
    def test_crawl
        @q = Bot.search(params[:q])
        @bot = Bot.find(params[:id])
        doc = Nokogiri::HTML(open("#{@bot.url}"))
        @crawl = doc.xpath("#{@bot.xpath}").inner_html
    end
    
    def test_if_crawl
        @q = Bot.search(params[:q])
        @bot = Bot.find(params[:id])
        doc = Nokogiri::HTML(open("#{@bot.url}"))
        doc.css('table').each do |crawl|
            @crawl = crawl.inner_html.encode("UTF-8")
             if @crawl.encode("UTF-8").include?(@bot.word1) && @crawl.encode("UTF-8").include?(@bot.word2) && @crawl.encode("UTF-8").include?(@bot.word3)
                 @if_crawl = crawl.inner_html.encode("UTF-8")
             end
         end
    end
    
    def test_slice_crawl
        @q = Bot.search(params[:q])
        @bot = Bot.find(params[:id])
        @doc = Nokogiri::HTML(open("#{@bot.url}")).inner_html.encode("UTF-8")#URLの指定
        @index_doc = @doc.index("#{@bot.upper}")
        @end_doc = @doc.rindex("</html>") - 1
        @slice_crawl_pre = @doc.slice(@index_doc..@end_doc)
        @table_doc = @slice_crawl_pre.index("table>") + 5
        @slice_crawl = @slice_crawl_pre.slice(0..@table_doc)
    end
    
    def failure
        @q = Bot.search(params[:q])
        @bot = Bot.find(params[:id])
        @error = params[:error]
    end
    
    def togikai
    end
    
      private
      
        def bot_params
          params.require(:bot).permit(:name, :url, :article_id, :date, :xpath, :word1, :word2, :word3, :upper)
        end
end
