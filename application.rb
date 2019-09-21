require 'bundler'
Bundler.require

Dir.glob('src/**/*.rb').each {|f| load f }
