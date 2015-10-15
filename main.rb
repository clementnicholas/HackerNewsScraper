require_relative 'post'
require 'nokogiri'
require 'rubygems'
require 'pry'
require 'open-uri'
require 'colorize'

ARGV

url = ARGV[0]
post = Post.new(url)

puts post.get_title.red
puts post.get_points.yellow

post.comments.take(25).each {|comment| puts comment}


