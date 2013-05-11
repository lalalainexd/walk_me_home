class EndedTrekFinder
  @queue = :ended_trek_finder_queue
  def self.perform
    Trek.all.each do |trek|
      if trek.expected_end_at < Time.now
        Resque.enqueue(TrekRemover, trek.id)
      end
    end
  end

end
