class AddColumnsStreetAndCityAndStateZipAndCountryAndPrecinctToVotingLocations < ActiveRecord::Migration
  def change
    add_column :voting_locations, :precinct, :string
    add_index :voting_locations, :precinct
    add_column :voting_locations, :street, :string
    add_column :voting_locations, :city, :string
    add_column :voting_locations, :state_zip, :string
    add_column :voting_locations, :country, :string
  end
end
