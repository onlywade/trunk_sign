#!/usr/bin/env ruby

require 'rubygems'
require 'flipper'

$flipper = Flipper.new

loop do

  now = Time.now.strftime("%D %H:%M")

  # check if trunk is locked
  puts "#{now} -- " + `is-trunk-open`; $stdout.flush
  if $? && ($?.exitstatus == 0)
    $flipper.off
  else
    $flipper.on
  end
  sleep 60

end
