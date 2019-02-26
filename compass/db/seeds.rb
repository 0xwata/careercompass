# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

path_sje = File.join Rails.root, "db/csv/sample_job_experiences.csv"
path_sc = File.join Rails.root, "db/csv/sample_companies.csv"
path_su = File.join Rails.root, "db/csv/sample_users.csv"
path_ss = File.join Rails.root, "db/csv/sample_sectors.csv"
path_sj = File.join Rails.root, "db/csv/sample_jobs.csv"

"""
sample_job_experiences.csvのカラム
:params row[0]: id
:params row[1]: user_id
:params row[2]: company_id
:params row[3]: job_id
:params row[4]: experience
:params row[5]: start_of_date
:params row[6]: end_of_date
"""
list = []
p 'sje'
CSV.foreach(path_sje, headers: true) do |row| #headers: trueにより、headerを認識
  
  list = [] #リストの初期化
  list << {
    user_id: row[1],
    company_id: row[2],
    job_id: row[3],
    experience: row[4],
    start_of_date: row[5],
    end_of_date: row [6],
  }
  JobExperience.create!(list) #リストをテーブルに書き込む
end

"""
sample_sc.csvのカラム
:params row[0]: id
:params row[1]: company_name
:params row[2]: sector_id
"""

list = []
p 'sc'
CSV.foreach(path_sc, headers: true) do |row| #headers: trueにより、headerを認識
  list = [] #リストの初期化
  list << {
    name: row[1],
    sector_id: row[2]
  }
  Company.create!(list) #リストをテーブルに書き込む
end


"""
sample_su.csvのカラム
:params row[0]: id
:params row[1]: user_name
"""

list = []
p 'su'
CSV.foreach(path_su, headers: true) do |row| #headers: trueにより、headerを認識
  list = [] #リストの初期化
  list << {
    name: row[1]
  }
  User.create!(list) #リストをテーブルに書き込む
end


"""
sample_ss.csvのカラム
:params row[0]: id
:params row[1]: sector_name
"""

list = []
p 'ss'
CSV.foreach(path_ss, headers: true) do |row| #headers: trueにより、headerを認識
  list = [] #リストの初期化
  list << {
    name: row[1]
  }
  Sector.create!(list) #リストをテーブルに書き込む
end

"""
sample_sj.csvのカラム
:params row[0]: id
:params row[1]: job_name
"""

list = []
p 'sj'
CSV.foreach(path_sj, headers: true) do |row| #headers: trueにより、headerを認識
  list = [] #リストの初期化
  list << {
    name: row[1]
  }
  Job.create!(list) #リストをテーブルに書き込む
end

