class Message 

  attr_reader :content

  def initialize(content)
    @content = content 
  end

  def self.construct(content)
    new(content)
  end

  def starting_trip?
    words = self.content.split(" ")
    return true if words.include?("Start")
  end

  def duration
    #find the number in self, return that
  end


end 