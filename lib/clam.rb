# frozen_string_literal: true

require 'rufus-scheduler'
require 'clamby'
require_relative '../config/log'

scheduler = Rufus::Scheduler.new

scheduler.every '2h' do
  Clamby.update
end

class ClamUtils
  def scan(filename)
    Clamby.configure(daemonize: false)
    virus_found = Clamby.virus?(filename)
    return true if virus_found

    false
  end
end
