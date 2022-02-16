class WeeklyChatJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    User.find_each do |user|
      @user = User.find_by_id(user.id)
      UserMailer.weekly_chats(@user.id, weekly_chat_details).deliver_now if @user.present?
    end
  end

  private

  def weekly_chat_details
    {
      last_week_of_messages_count: @user.last_week_of_messages_count,
      messages_count_since_your_last_message: @user.messages_count_since_your_last_message,
      user_last_message_at: @user.user_last_message_at
    }
  end
end
