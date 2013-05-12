class Message 

  attr_reader :content

  def initialize(content)
    @content = content 
  end

  def self.construct(content)
    new(content)
  end

  def starting_trip?
    words.include?("start")
  end

  def duration
    self.content.scan(/\d/).join("")
  end

  def cancel_trip?
    words.include?("cancel")
  end

  def home_safely?
    words.include?("yes")
  end

  def extend_trip?
    words.include?("extend")
  end

  private

  def words
    self.content.split(" ").collect { |word| word.downcase }
  end
end 