namespace :crawl do
  desc "auto_crawl"
  task :crawl => :environment do
        @bots = Bot.all#登録した情報を全て取得
        
        
        @i= 0
        @time = Time.new.strftime("%Y-%m-%d　%H:%M")
        @bots.each do |bot|
            doc = Nokogiri::HTML(open("#{bot.url}"))#URLの指定
            @crawl = doc.xpath("#{bot.xpath}").inner_html#xpathの情報を抽出
            @i += 1
               ##Mysqlに抽出情報とpost_idを保存
               begin
                    connection = Mysql::connect("153.120.105.36", "miyagise_sagae", "s19930528", "miyagise_senkyo_db")
                    connection.query("set character set utf8")
                    connection.query("UPDATE  `se_postmeta` SET  `meta_value` =  '#{@time}<table> #{@crawl} </table>' WHERE  `post_id` = '#{bot.article_id}' AND meta_key='votes';")
                    connection.close
                rescue => e#データが保存されない場合管理者にメールを送信
                  	PostMailer.post_email(bot).deliver
                end
                
              if  @i > @bots.count then
                break
              end
  
            doc.delete(Nokogiri::HTML(open("#{bot.url}")))#URLの削除
            @crawl.clear#xpathの情報を削除
        end
  end
end