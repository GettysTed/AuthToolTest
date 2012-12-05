class Tour < ActiveRecord::Base

  attr_accessible :user_id, :name, :sites, :desc, :zipurl, :size, :published
  belongs_to :user
  has_many :sites
  validates :published, :inclusion => {:in => [true, false]}


end