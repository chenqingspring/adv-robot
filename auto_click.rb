#!/usr/bin/env ruby

require 'capybara'
require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new
page = Capybara::Selenium::Driver.new('pm2.5-inquiry',:browser => :chrome)
file_path = "file://#{Dir.pwd}/ads.html"

app_urls = ['http://pm25-inquiry.info',
            'http://pm25-inquiry.info/sort/top10',
            'http://pm25-inquiry.info/sort/bottom10',
            'http://pm25-inquiry.info/zones/xian',
            'http://pm25-inquiry.info/zones/beijing',
            'http://pm25-inquiry.info/zones/xianyang',
            'http://pm25-inquiry.info/zones/tianjin',
            file_path]

index = 0
scheduler.every '20s', :first_in => 0 do
  app_url = app_urls.at(rand(app_urls.length))
  system ("printf 'open: \033[33;33m%s\e[0m, times: \033[33;32m%d\e[0m \r' #{app_url} #{index}")
  page.visit(app_url)
  index += 1
end

scheduler.join