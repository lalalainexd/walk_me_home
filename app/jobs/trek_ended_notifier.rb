class TrekEndedNotifier

  @queue = :trek_ended_notifier_queue

  def self.perform(trek_id)
    trek = Trek.find_by_id(trek_id)
    if trek
      text = Text.new(trek.user.phone_number)
      text.confirm_home
    end
  end

end
