class UserMailer < ApplicationMailer
  def weekly_chats(user_id, weekly_chat_details)
    @user = User.find(user_id)
    @weekly_chat_details = weekly_chat_details

    mail(to: @user.email, subject: "Your weekly Chat Details")
  end
end
  