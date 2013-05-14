class TrekEndedNotifier

  @queue = :trek_ended_notifier_queue

  def self.perform(trek_id)
    trek = Trek.find_by_id(trek_id)
    if trek && trek.count < 3
      trek.extend_time(10)
      trek.count += 1
      trek.save
      text = Text.new(trek.user.phone_number)
      text.confirm_home
    elsif trek
      trek.stop
      trek.count+=1
      trek.save
      text = Text.new(trek.user.emergency_contacts.first.phone_number)
      text.emergency(trek.user.full_name)
    end
  end

end
