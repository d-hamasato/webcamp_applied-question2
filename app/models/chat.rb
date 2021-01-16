class Chat < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :room, dependent: :destroy
  
  validates :content, presence: true
  
end
