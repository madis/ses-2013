require 'minitest/autorun'
require 'minitest/reporters'
ENV["RAILS_ENV"] = "test"
# require "minitest/pride"
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new
