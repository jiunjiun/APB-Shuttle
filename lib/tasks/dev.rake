# encoding: utf-8
namespace :dev do

  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", :setup ]

  desc "Setup system data"
  task :setup => :environment do
    puts "Create Bus"

    # 局本部
    Bus.new({name: '航警局', kind: 1, special: false, note: '中型警備車', depart: '08:40'}).save
    Bus.new({name: '航警局', kind: 1, special: false, note: '中型警備車', depart: '09:10'}).save
    Bus.new({name: '航警局', kind: 1, special: false, note: '中型警備車', depart: '10:40'}).save
    Bus.new({name: '航警局', kind: 1, special: false, note: '中型警備車', depart: '11:10'}).save
    Bus.new({name: '航警局', kind: 1, special: false, note: '中型警備車', depart: '11:40'}).save
    Bus.new({name: '航警局', kind: 1, special: false, note: '中型警備車', depart: '12:40'}).save
    Bus.new({name: '航警局', kind: 1, special: false, note: '中型警備車', depart: '13:10'}).save
    Bus.new({name: '航警局', kind: 1, special: false, note: '中型警備車', depart: '14:40'}).save
    Bus.new({name: '航警局', kind: 1, special: false, note: '中型警備車', depart: '15:10'}).save
    Bus.new({name: '航警局', kind: 1, special: false, note: '中型警備車', depart: '15:40'}).save
    Bus.new({name: '航警局', kind: 1, special: false, note: '中型警備車', depart: '16:40'}).save

    # 安檢
    Bus.new({name: '航警局', kind: 2, special: false, note: '中型警備車', depart: '04:50'}).save
    Bus.new({name: '航警局', kind: 2, special: true, note: '中型警備車', depart: '08:50'}).save
    Bus.new({name: '航警局', kind: 2, special: true, note: '中型警備車', depart: '11:00'}).save
    Bus.new({name: '航警局', kind: 2, special: true, note: '中型警備車', depart: '11:10'}).save
    Bus.new({name: '航警局', kind: 2, special: true, note: '中型警備車', depart: '13:00'}).save
    Bus.new({name: '航警局', kind: 2, special: true, note: '中型警備車', depart: '14:50'}).save
    Bus.new({name: '航警局', kind: 2, special: true, note: '中型警備車', depart: '15:10'}).save
    Bus.new({name: '航警局', kind: 2, special: false, note: '中型警備車', depart: '17:05'}).save
    Bus.new({name: '航警局', kind: 2, special: false, note: '中型警備車', depart: '21:00'}).save
    Bus.new({name: '航警局', kind: 2, special: false, note: '中型警備車', depart: '23:00'}).save
    Bus.new({name: '航警局', kind: 2, special: false, note: '中型警備車', depart: '23:25'}).save

    # 保安
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '01:40'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '02:10'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '03:40'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '04:10'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '大型警備車', depart: '05:40'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '06:10'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '07:40'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '08:10'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '08:20'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '09:40'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '10:10'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '12:10'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '13:40'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '大型警備車', depart: '14:10'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '16:10'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '17:40'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '18:10'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '19:40'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '20:10'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '21:40'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '22:10'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '23:40'}).save
    Bus.new({name: '航警局', kind: 3, special: false, note: '中型警備車', depart: '00:10'}).save





  end
end