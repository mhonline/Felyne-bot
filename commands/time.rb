module FelyneBot
  module Commands
    module Time
      extend Discordrb::Commands::CommandContainer
		command(:time) do |event|
			cmdcount += 1
			t1 = Time.parse('19:00')
			t1 = t1.to_i
			t2 = Time.now
			t2 = t2.to_i
			if t1 > t2
				t3 = t1 - t2
				event << "#{Time.at(t3).strftime('**%H** hours **%M** minutes **%S** seconds')} left until the next exp/gift reset"
			else
				t1 += 86_400
				t3 = t1 - t2
				event << "#{Time.at(t3).strftime('**%H** hours **%M** minutes **%S** seconds')} left until the next exp/gift reset"
			end
			puts 'CMD: exp reset'
		end
    end
  end
end
