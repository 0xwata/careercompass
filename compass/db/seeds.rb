# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

path_sje = File.join Rails.root, "db/csv/sample_job_experiences.csv"
# path_sc = File.join Rails.root, "db/csv/sample_companies.csv"
# path_su = File.join Rails.root, "db/csv/sample_users.csv"
# path_ss = File.join Rails.root, "db/csv/sample_sectors.csv"
# path_sj = File.join Rails.root, "db/csv/sample_jobs.csv"

"""
sample_job_experiences.csvのカラム
:params row[0]: id
:params row[1]: user_name
:params row[2]: company_name
:params row[3]: job_name
:params row[4]: experience
:params row[5]: start_date
:params row[6]: end_date
:params row[7]: order_id
"""
list = []
user_list = []
company_list = []
job_list = []

p 'Before create JobExperience'
CSV.foreach(path_sje, headers: true) do |row| #headers: trueにより、headerを認識

  user_list.push(row[1])
  company_list.push(row[2])
  job_list.push(row[3])

end


if User.count == 0
  user_list.uniq.each do |row|
    user = User.new
    user.name = row
    user.save
  end
end

if Company.count == 0
  company_list.uniq.each do |row|
    company = Company.new
    company.name = row
    company.save
  end 
end

if Job.count == 0
  job_list.uniq.each do |row|
    job = Job.new
    job.name = row
    job.save
  end
end

if Career.count == 0
  p 'start: career'
  CSV.foreach(path_sje, headers: true) do |row| #headers: trueにより、headerを認識
    if row[5] == "NULL"
      row[5] = Date.today
    end
    career = Career.new(user_id:User.find_by(name:row[1]).id,
                        company_id: Company.find_by(name:row[2]).id,
                        job_id: Job.find_by(name:row[3]).id,
                        experience: row[6],
                        start_date: row[4],
                        end_date: "#{row[5]}")
    career.save
  end
end 

if CareerPath.count == 0
  p 'start: career_path'
  user_ids = Career.group(:user_id).pluck(:user_id)
    user_ids.each do |user_id|  
      order_id = 0
      career_histories = Career.where(user_id: "#{user_id}").order(:start_date)
      history_was = career_histories.first.company_id
      career_histories.each do |career_history|
        next if career_history.id == career_histories.first.id
        history_is = career_history.company_id
        p "#{order_id}|#{user_id}':'#{history_was}'→'#{history_is}"
        #careerpathにデータを追加
        careerpath = CareerPath.new
        careerpath.user_id = user_id
        careerpath.from_career = history_was
        careerpath.to_career = history_is 
        careerpath.order_id = order_id
        careerpath.save
        order_id += 1
        history_was = career_history.company_id
      end
    end
end

"""
sample_sc.csvのカラム
:params row[0]: id
:params row[1]: company_name
:params row[2]: sector_id
"""

# list = []
# p 'sc'
# CSV.foreach(path_sc, headers: true) do |row| #headers: trueにより、headerを認識
#   list = [] #リストの初期化
#   list << {
#     name: row[1],
#     sector_id: row[2]
#   }
#   Company.create!(list) #リストをテーブルに書き込む
# end


# """
# sample_su.csvのカラム
# :params row[0]: id
# :params row[1]: user_name
# """

# list = []
# p 'su'
# CSV.foreach(path_su, headers: true) do |row| #headers: trueにより、headerを認識
#   list = [] #リストの初期化
#   list << {
#     name: row[1]
#   }
#   User.create!(list) #リストをテーブルに書き込む
# end


# """
# sample_ss.csvのカラム
# :params row[0]: id
# :params row[1]: sector_name
# """

# list = []
# p 'ss'
# CSV.foreach(path_ss, headers: true) do |row| #headers: trueにより、headerを認識
#   list = [] #リストの初期化
#   list << {
#     name: row[1]
#   }
#   Sector.create!(list) #リストをテーブルに書き込む
# end

# """
# sample_sj.csvのカラム
# :params row[0]: id
# :params row[1]: job_name
# """

# list = []
# p 'sj'
# CSV.foreach(path_sj, headers: true) do |row| #headers: trueにより、headerを認識
#   list = [] #リストの初期化
#   list << {
#     name: row[1]
#   }
#   Job.create!(list) #リストをテーブルに書き込む
# end

