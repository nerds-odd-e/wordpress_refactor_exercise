# encoding: UTF-8
require 'capybara/cucumber'
require 'capybara/mechanize'

Capybara.default_driver = :mechanize
Capybara.app = true
Capybara.app_host = "http://atdd.local"
