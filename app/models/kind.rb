class Kind < ActiveRecord::Base
  has_many :snippets, dependent: :destroy

  validates :name, presence: true
end
