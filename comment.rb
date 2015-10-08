class Comment

  attr_reader :author, :text

  def initialize(author, text)
    @author = author
    @text = text
  end

  def display
    "#{@author}: #{@text}"
  end
end