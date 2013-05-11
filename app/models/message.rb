class Message 

  attr_reader :content

  def initialize(content)
    @content = content 
  end

  def self.construct(content)
    new(content)
  end

  def starting_trip?
    words.include?("Start")
  end

  def duration
    self.content.scan(/\d/).join("")
  end

  def cancel_trip?
    words.include?("Cancel")
  end

  def home_safely?
    words.include?("Yes")
  end

  def extend_trip?
    words.include?("Extend")
  end

  private

  def words
    self.content.split(" ")
  end
end 