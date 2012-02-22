require 'rubygems'
require 'bundler'

Bundler.require

require './config/amazon_s3'
require './models/image'
require './app'

run Sinatra::Application