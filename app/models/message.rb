class Message 

  attr_reader :content

  def initialize(content)
    @content = content 
  end

  def self.construct(content)
    new(content)
  end

  def starting_trip?
    return true if words.include?("Start")
  end

  def duration
    self.content.scan(/\d/).join("")
  end

  def cancel_trip?
    return true if words.include?("Cancel")
  end

  private

  def words
    self.content.split(" ")
  end
end 