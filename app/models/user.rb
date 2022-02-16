class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, uniqueness: true, presence: true

  has_many :room_messages, inverse_of: :user, dependent: :destroy

  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def last_week_of_messages_count
    room_messages.in_period(from: 1.week.ago, to: Time.current)&.count if room_messages.limit(1).present?
  end

  def user_last_message_at
    room_messages&.order(created_at: :desc)&.limit(1)&.last&.created_at
  end

  def messages_count_since_your_last_message
    room_messages.in_period(from: user_last_message_at, to: Time.current).count if room_messages.limit(1).present? 
  end
end
