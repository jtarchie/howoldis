#!/usr/bin/env ruby

require 'date'
require 'fileutils'
require 'active_support'
require 'action_view'

include ActionView::Helpers::DateHelper

slug_dates = {
  ada: Date.civil(1980, 2, 1),
  ballerina: Date.civil(2017, 1, 1),
  ceylon: Date.civil(2011, 1, 1),
  crystal: Date.civil(2014, 6, 18),
  cuneiform: Date.civil(2013, 1, 1),
  dart: Date.civil(2011, 10, 10),
  elixir: Date.civil(2011, 1, 1),
  elm: Date.civil(2012, 1, 1),
  erlang: Date.civil(1986, 1, 1),
  fortran: Date.civil(1957, 1, 1),
  golang: Date.civil(2009, 11, 10),
  hack: Date.civil(2014, 1, 1),
  java: Date.civil(1995, 5, 23),
  julia: Date.civil(2012, 1, 1),
  kotlin: Date.civil(2011, 1, 1),
  lua: Date.civil(1993, 1, 1),
  monkeyx: Date.civil(2011, 3, 1),
  opa: Date.civil(2011, 1, 1),
  p4: Date.civil(2013, 1, 1),
  p: Date.civil(2012, 1, 1),
  perl6: Date.civil(2015, 12, 25),
  perl: Date.civil(1987, 12, 18),
  red: Date.civil(2011, 1, 1),
  ring: Date.civil(2016, 1, 25),
  ruby: Date.civil(1995, 1, 1),
  rust: Date.civil(2010, 7, 7),
  swift: Date.civil(2014, 6, 2),
  typescript: Date.civil(2012, 10, 1),
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


