class Talk < ActiveRecord::Base
  has_many :comments, :as => :commentable
  belongs_to :user
  acts_as_voteable

  validates :content, :presence => true
  def to_param
    "#{id}-#{title.parameterize}"
  end
end
