class PostMailer < ActionMailer::Base
  default from: "from@example.com"

  def post_email(data)
    @data = data
    mail to: "miyagi.seiji.press@gmail.com", subject: "#{data.name}から抽出したデータが保存されていません。"
  end
end