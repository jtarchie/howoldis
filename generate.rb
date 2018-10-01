#!/usr/bin/env ruby

require 'date'
require 'fileutils'
require 'active_support'
require 'action_view'

include ActionView::Helpers::DateHelper

slug_dates = {
  java: Date.civil(1995, 5, 23)
}

slug_dates.each do |name, date|
  path = File.join(__dir__, 'docs', name.to_s)
  FileUtils.mkdir_p(path)
  File.write(File.join(path, 'index.html'), <<~HTML)
  <html><body>#{name} is #{distance_of_time_in_words date, Time.now}</body></html>
  HTML
end


