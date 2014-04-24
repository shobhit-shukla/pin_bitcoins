class User < ActiveRecord::Base
  validates_presence_of :name,:email,:password
  has_many :bitcoin_infos
  has_many :bets
end
