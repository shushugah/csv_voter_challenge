class AddColumnsStreetAndAptAndCityAndStateAndZipAndPrecinctIdToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :voters, :string
    add_column :voters, :street, :string
    add_column :voters, :apt, :string
    add_column :voters, :city, :string
    add_column :voters, :state, :string
    add_column :voters, :zip, :string
    add_column :voters, :precinct_id, :string
    add_index :voters, :precinct_id
  end
end
