class Show < ActiveRecord::Base
  validates :date, :venue, :location, :info, presence: true
end
