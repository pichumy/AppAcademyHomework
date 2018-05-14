# == Schema Information
#
# Table name: albums
#
#  id      :bigint(8)        not null, primary key
#  band_id :integer          not null
#  title   :string           not null
#  year    :date             not null
#  state   :boolean          default(TRUE)
#

class Album < ApplicationRecord
  # state = true means live, state = false means studio
   validates :title, :state, :year, :band_id, presence: true

   belongs_to :band,
   foreign_key: :band_id,
   class_name: :Band

end
