class AddColumnPrecinctShortenedToVotingLocations < ActiveRecord::Migration
  def change
  	add_column :voting_locations, :precinct_shortened, :string
  	add_index :voting_locations, :precinct_shortened
  end
end
