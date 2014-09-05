class AddColumnPrecinctIdShortenedToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :precinct_id_shortened, :string
    add_index :voters, :precinct_id_shortened
  end
end
