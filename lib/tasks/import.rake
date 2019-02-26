require 'csv'

# # rake import:users
# namespace :import do
#   desc "Import job_experiences from csv"

#   task job_experiences: :environment do
#     path = File.join Rails.root, "db/csv/sample.csv"
#     puts "path: #{path}"
#     list = []
#     CSV.foreach(path, headers: true) do |row|
#       list << {
#         user_id: row["user_id"],
#         company_id: row["company_id"],
#         job_id: row["job_id"],
#         experience: row["experience"],
#         start_of_date: row["start_of_date"],
#         end_of_date: row ["end_of_date"],
#       }
#     end
#     puts "start to create job_experiences data"
#     begin
#       JobExperience.create!(list)
#       puts "completed"
#     rescue ActiveModel::UnknownAttributeError => invalid
#        puts "raised error : unKnown attribute "
#     end
#   end
# end

# path = File.join Rails.root, "db/csv/sample.csv"
# list = []
# CSV.foreach(path, headers: true) do |row|
#   list = [] #リストの初期化
#   list << {
#     user_id: row["user_id"],
#     company_id: row["company_id"],
#     job_id: row["job_id"],
#     experience: row["experience"],
#     start_of_date: row["start_of_date"],
#     end_of_date: row ["end_of_date"],
#   }
#   JobExperience.create(list) #リストをテーブルに書き込む
# end