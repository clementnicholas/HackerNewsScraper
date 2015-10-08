require_relative 'post'
require 'nokogiri'
require 'rubygems'
require 'pry'
require 'open-uri'

ARGV

url = ARGV[0]
post = Post.new(url)


puts post.get_title
puts post.get_points


post.comments.each {|comment| puts comment}


