Bot.create!(name:  "サンプル",
             url: "http://www.city.shijonawate.lg.jp/gyosei/senkyogyoseiinkai/senkyo/shichousenkyo/1487916794217.html",
             article_id:              "110497",
             date:              "#{Date.today}",
             xpath:              "//*[@id='contentsIn']/div[1]/table[2]",
             word1:              "候補者の氏名",
             word2:              "22時00分",
             word3:              "最終",
             upper:              "<table border='2' cellpadding='0' cellspacing='0' style='width: 700px;' width='489'>")
Election.create!(name:  "サンプル",
             description: "http://www.city.shijonawate.lg.jp/gyosei/senkyogyoseiinkai/senkyo/shichousenkyo/1487916794217.html",
             article_id:              "11111",
             worker:              "寒河江",
             status:              "待機")
Election.create!(name:  "サンプル",
             description: "http://www.city.shijonawate.lg.jp/gyosei/senkyogyoseiinkai/senkyo/shichousenkyo/1487916794217.html",
             article_id:              "11111",
             worker:              "寒河江",
             status:              "稼働")
Election.create!(name:  "サンプル",
             description: "http://www.city.shijonawate.lg.jp/gyosei/senkyogyoseiinkai/senkyo/shichousenkyo/1487916794217.html",
             article_id:              "11111",
             worker:              "寒河江",
             status:              "終了")
for num in 1..10 do
Task.create!(name:  "サンプル",
             deadline:              Time.now)
end