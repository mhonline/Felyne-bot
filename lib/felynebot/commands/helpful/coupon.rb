module FelyneBot
	module Commands
		module Coupon
			extend Discordrb::Commands::CommandContainer
			command(
					:coupon,
					description: "Purchasing Coupons help.",
					useage: "coupon"
			) do |event|
				event << "<http://i.imgur.com/ynbKtR4.png>"
				puts "#{event.timestamp}: #{event.user.name}: CMD: coupon"
				nil
			end
		end
	end
end