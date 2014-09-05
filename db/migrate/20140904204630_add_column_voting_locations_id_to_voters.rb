class AddColumnVotingLocationsIdToVoters < ActiveRecord::Migration
  def change
  	add_reference(:voters, :voting_location, index: true)
  end
end
