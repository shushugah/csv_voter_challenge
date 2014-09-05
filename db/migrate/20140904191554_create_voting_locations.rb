class CreateVotingLocations < ActiveRecord::Migration
  def change
    create_table :voting_locations do |t|

      t.timestamps
    end
  end
end
