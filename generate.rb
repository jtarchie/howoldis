#!/usr/bin/env ruby

require 'date'
require 'fileutils'
require 'active_support'
require 'action_view'

include ActionView::Helpers::DateHelper

slug_dates = {
  elixir: Date.civil(2011, 1, 1),
  erlang: Date.civil(1986, 1, 1),
  golang: Date.civil(2009, 11, 10),
  lua: Date.civil(1993, 1, 1),
  java: Date.civil(1995, 5, 23),
  perl: Date.civil(1987, 12, 18),
  ruby: Date.civil(1995, 1, 1),
}

docs = File.join(__dir__, 'docs')
slug_dates.each do |name, date|
  path = File.join(docs, name.to_s)
  FileUtils.mkdir_p(path)
  File.write(File.join(path, 'index.html'), <<~HTML)
  <html><body>#{name} is #{distance_of_time_in_words date, Time.now}</body></html>
  HTML
end

File.write(File.join(docs, 'index.html'), <<~HTML)
<html><body>#{ slug_dates.map{|n, _| "<a href='#{n}/'>#{n}</a>"}.join('<br>') }</body></html>
HTML


