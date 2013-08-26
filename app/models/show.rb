# == Schema Information
#
# Table name: shows
#
#  id         :integer          not null, primary key
#  date       :date
#  venue      :string(255)
#  location   :string(255)
#  info       :text
#  link       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Show < ActiveRecord::Base
  validates :date, :venue, :location, presence: true
end
