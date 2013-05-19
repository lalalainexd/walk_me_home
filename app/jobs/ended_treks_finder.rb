class EndedTreksFinder
  @queue = :ended_trek_finder_queue
  def self.perform
    Trek.all.each do |trek|
      if trek.pending_end?
        Resque.enqueue(TrekEndedNotifier, trek.id)
      end
    end
  end
end
