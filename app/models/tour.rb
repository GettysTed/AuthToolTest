class Tour < ActiveRecord::Base

  attr_accessible :user_id, :name, :sites, :desc, :zipurl, :size
  belongs_to :user
  has_many :sites


end