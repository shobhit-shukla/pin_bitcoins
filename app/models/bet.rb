class Bet < ActiveRecord::Base
  validates_presence_of :description ,:amount
  serialize :betbetween, Array
  belongs_to :user
end
