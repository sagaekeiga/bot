class BotsController < ApplicationController

      include ActiveModel::Model

    def new
     @bot = Bot.new
    end

    def create
     @bot = Bot.new(bot_params)
     @bot.save
     redirect_to bots_path
    end
    
    def destroy
        @bot = Bot.find(params[:id])
        if @bot.delete
         flash[:success] = "deleted"
        end
        redirect_to root_path
    end
    
    def index
      @b_search_form = SearchForm.new
      @bots = Bot.all
    end
    
    def show
      @bot = Bot.find(params[:id])
    end
    
    def crawl
        @bots = Bot.all#登録した情報を全て取得
        
        @bots.each do |bot|
            doc = Nokogiri::HTML(open("#{bot.url}"))#URLの指定
            @crawl = doc.xpath("#{bot.xpath}").inner_html#xpathの情報を抽出
            
               ##Mysqlに抽出情報とpost_idを保存
               begin
                    connection = Mysql::connect("153.120.105.36", "miyagise_sagae", "s19930528", "miyagise_kari")
                    connection.query("set character set utf8")
                    connection.query("UPDATE  `se_postmeta` SET  `meta_value` =  '#{crawl}' WHERE  `post_id` = '#{bot.article_id}' AND meta_key='votes';")
                    connection.close
                rescue => e#データが保存されない場合管理者にメールを送信
                  	PostMailer.post_email.deliver
                end
                
            doc.delete(Nokogiri::HTML(open("#{url}")))#URLの削除
            @crawl.delete(doc.xpath("#{bot.xpath}").inner_html)#xpathの情報を削除
        end
            
    end
    
    def edit
        @bot = Bot.find(params[:id])
    end
    
    def update
        @bot = Bot.find(params[:id])
        @bot.update(bot_params)
        render 'edit'
    end
    
    def detection ##検索結果表示ページを表示
      @b_search_form = SearchForm.new(params[:b_search])
      @search_bots = @b_search_form.bot_search(@b_search_form.name)
    end
    
      private
      
        def bot_params
          params.require(:bot).permit(:name, :url, :article_id, :date, :xpath)
        end
end
