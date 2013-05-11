class TrekManager
  @queue = :manage_trek_queue

  def self.perform
    Trek.all.each do |trek|
      if trek.expected_end_at < Time.now
        puts "TREK IS OVER"
      else
        puts "TREK IS NOT OVER"
      end
    end
  end
end
