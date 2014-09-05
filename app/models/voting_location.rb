class VotingLocation < ActiveRecord::Base
	has_many :voters
end
