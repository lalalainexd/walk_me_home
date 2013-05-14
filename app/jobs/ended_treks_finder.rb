class EndedTreksFinder
  @queue = :ended_trek_finder_queue
  def self.perform
    Trek.all.each do |trek|
      if trek.pending_end?
        trek.extend_time(10)
        Resque.enqueue(TrekEndedNotifier, trek.id)
      end
    end
  end

end
