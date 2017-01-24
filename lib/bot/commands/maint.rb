module Commands
  # Command Module
  module Maint
    extend Discordrb::Commands::CommandContainer
    command(
      :maint,
      bucket: :delay300,
      description: 'Checks time left in game maintenance.',
      usage: 'maint'
    ) do |event|
      t1 = Time.now

      t3 = $info['maint']['start']
      unless t3.nil?
        t3 = Time.parse(t3)
        sh1 = TimeDifference.between(t1, t3).in_hours
        sm1 = TimeDifference.between(t1, t3).in_minutes
        sh2 = sh1.floor
        sm1 -= 60 * sh2
        sm2 = sm1.floor
      end

      t4 = $info['maint']['end']
      unless t4.nil?
        t4 = Time.parse(t4)
        eh1 = TimeDifference.between(t1, t4).in_hours
        em1 = TimeDifference.between(t1, t4).in_minutes
        eh2 = eh1.floor
        em1 -= 60 * eh2
        em2 = em1.floor
      end
      started = if t3.nil?
                  'Maintenance start time not set.'
                elsif t3.past?
                  'Maintenance has started!'
                else
                  "#{sh2} hours #{sm2} minutes left until start of maintenance"
                end
      ended = if t4.nil?
                'Maintenance end time not set.'
              elsif t4.past?
                'Maintenance has Ended! GO HUNTING!'
              else
                "#{eh2} hours #{em2} minutes left until end of maintenance"
              end
      e = embed('MHO Server maintenance:', "#{started}\n#{ended}")
      event.channel.send_embed '', e
      command_log('maint', event.user.name)
      nil
    end
  end
end
