class Message < ApplicationRecord
  enum messenger: [:viber, :telegram, :whatsapp]

  belongs_to :user

  validates :body, presence: true
  validates :to, presence: :true, allow_nil: false
end
