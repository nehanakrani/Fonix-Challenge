class RoomMessage < ApplicationRecord
  belongs_to :user, inverse_of: :room_messages
  belongs_to :room, inverse_of: :room_messages

  scope :after, ->(time: Time.current) { where("created_at >= :time", time: time) }
  scope :before, ->(time: Time.current) { where("created_at <= :time", time: time) }
  scope :in_period, ->(from: 1.week.ago, to: Time.current) { before(time: to).after(time: from) }
  
  def as_json(options)
    super(options).merge(user_avatar_url: user.gravatar_url)
  end

end
