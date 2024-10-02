class Tweet < ApplicationRecord
  has_one_attached :image
  validates :message, presence: { message: "メッセージが空です" }, length: { maximum: 140, message: "メッセージは140文字以内にしてください" }
end
