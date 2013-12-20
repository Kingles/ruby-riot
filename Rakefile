#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'
 require 'rubygems'
 require 'bundler/setup'
  
Rake::TestTask.new do |t|
  t.test_files = FileList['spec/lib/ruby-riot/*_spec.rb']
  t.verbose = true
end
 
task :default => :test
