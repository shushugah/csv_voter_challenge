class Voter < ActiveRecord::Base
	belongs_to :voting_location
	# Voter.where.not(voting_location: nil)
	# scope :has_loc, -> { |voting_location| where.not(voting_location: nil) }
end
