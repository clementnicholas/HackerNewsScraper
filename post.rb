require 'rubygems'
require 'pry'
require 'nokogiri'
require 'open-uri'
require_relative 'comment'

class Post

  attr_reader :title, :points, :comments

  def initialize(url)
    @page = Nokogiri::HTML(open(url))
    @title = get_title
    @points = get_points
    @url = url
    @item_id = get_item_id
    @comments = []
    generate_comments
  end

  def get_points
    @page.search('.subtext span').inner_text
  end

  def get_title
    @page.search('.title').inner_text
  end

  def puts_page
    @page
  end

  def get_item_id
    item_id = @url.split('/').last
    id_number = @url.split('=').last
  end

  def get_authors
    array_of_authors = @page.search('.comhead > a:first-child').map do |element|
      element.inner_text
    end
    array_of_authors[1..-1]
  end

  def get_texts
    @page.search('.comment > span:first-child').map do |text|
      text.inner_text.gsub(/\n.*/, '')
    end
  end

  def generate_comments
    authors_array = get_authors
    text_array = get_texts
    authors_array.each_with_index do |author, index| 
      comment = Comment.new(author, text_array[index])
      add_comment(comment)
    end
  end

  def add_comment(comment)
    @comments << comment
  end
 
end

