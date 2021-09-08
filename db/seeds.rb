
require 'csv'

file_path = 'lib/自治体一覧表.csv'
csv_data = CSV.read(file_path)

prefectures_list = csv_data.map { |row| row[1] }.uniq

cities_list = csv_data.map do |row|
    next if row[2] == nil
    row[1, 2]
  end.compact

prefectures_list.each do |prefecture|
  Prefecture.create(name: prefecture)
end

cities_list.each do |prefecture, city|
  prefecture = Prefecture.find_by(name: prefecture)
  prefecture.cities.create(name: city)
end
