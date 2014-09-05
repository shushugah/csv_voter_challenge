# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks



require 'csv'
desc "Imports CSV files"
task :import_csv_voters => :environment do
# Import CSV information about each fellow into database. 
csv_file_path = 'db/voter_file.csv'

	CSV.foreach(csv_file_path) do |row|
	  Voter.create!({
	    :street => row[0],
	    :apt => row[1],
	    :city => row[2],
	    :state => row[3],
	    :zip => row[4],
	    :precinct_id => row[5]  
	  })
	end
	Voter.first.destroy
end

desc "Imports voting poll locations"
task :import_csv_polling_locations => :environment do
# Import CSV information about each fellow into database. 
file_path = 'db/precinct_polling_list.csv'
# puts "has file path"
	CSV.foreach(file_path) do |row|
	  VotingLocation.create!({
	    :street => row[0],
	    :city => row[1],
	    :state_zip => row[2],
	    :country => row[3],
	    :precinct => row[4],
	    :precinct_shortened => row[4].last(3)
	  })
	end		
end

task :assign_voting_locations_to_voters => [:environment, :import_csv_polling_locations, :import_csv_voters]  do
	VotingLocation.all.each do |location|

	Voter.where(["precinct_id Like ? and state Like ?", "%#{location.precinct_shortened}", "#{location.state_zip.first(2)}"]).update_all(voting_location_id: location.id)
		end
	end 

task :export_list_of_voters_for_each_location => [:environment, :assign_voting_locations_to_voters]	do
CSV.open( "db/final_product.csv", 'w' ) do |csv_file|
	csv_file << ["Street", "Apt", "City", "State"]+["precinct", "street", "city", "state_zip", "country"]
  Voter.where.not(voting_location: nil).each do |voter|
    csv_file << voter.attributes.values[4..9]+ voter.voting_location.attributes.values[3..7]
  end
end	
end
