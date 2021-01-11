class ThanksMailer < ApplicationMailer
  default from: 'example@gmail.com'
  
  def welcome_email(user)
    @user = user
    # @url  = 'http://example.com/login'
    mail(to: @user.email, subject: "会員登録が完了しました。" )
  end
end