# -*- encoding : utf-8 -*-
class Talk < ActiveRecord::Base
  has_many :comments, :as => :commentable
  belongs_to :user
  acts_as_voteable
  validates :title, :presence => true
  validates :content, :presence => true
  after_initialize :default_values
  
  scope :published, lambda { where(:status => ['visible','confirmed']) }
  scope :recent, lambda { order("created_at desc") }

  def to_param
    "#{id}-#{title.parameterize}"
  end


  private
  def default_values
    # 'hidden visible confirmed closed'
    self.status ||= "hidden"
  end

end
