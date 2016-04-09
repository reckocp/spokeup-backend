class City < ActiveRecord::Base
  has_many :neighborhoods, dependent: :destroy
end
