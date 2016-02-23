class Snippet < ActiveRecord::Base
  belongs_to :user
  belongs_to :kind

  validates :title, presence: true,
                    uniqueness: true 

  validates :body, presence: true
end
