class PostMailer < ActionMailer::Base
  default from: "from@example.com"

  def post_email
    mail to: "sagae5.28rujeae@gmail.com", subject: "から抽出したデータが保存されていません。"
  end
end