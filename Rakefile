# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'guard/motion'
require 'bubble-wrap'
require 'bubble-wrap/all'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'motionsickness'
  app.frameworks += ['MapKit','AssetsLibrary']
end
