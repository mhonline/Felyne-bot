def list_raids(raids, channel)
    t1 = Time.now
    o = ""
    x = 0
    y = 1
    begin
    	t4 = raids[x]
    	t4 = Time.parse(t4)
    	d1 = TimeDifference.between(t1, t4).in_days
    	h1 = TimeDifference.between(t1, t4).in_hours
    	m1 = TimeDifference.between(t1, t4).in_minutes
    	d2 = d1.floor
    	h1 = h1 - 24 * d2
    	h2 = h1.floor
    	m1 = m1 - 60 * h2 - 24 * 60 * d2
    	m2 = m1.floor
    	if d2 == 0
			o += "**Raid #{y}**: #{raids[x+1].chomp(' is starting *now*!')} in #{h2} hours #{m2} minutes\n"
		else
			o += "**Raid #{y}**: #{raids[x+1].chomp(' is starting *now*!')} in #{d2} days #{h2} hours #{m2} minutes\n"
		end
		x += 10
		y += 1
    end while x < raids.length
	e = Discordrb::Webhooks::Embed.new
	e.author = {
		name: "Raids for #{channel}"
	}
	e.color = 0x673ab7
	e.description = o.chomp("\n")
	e.footer = { text: channel }
	e.timestamp = Time.now
	e
end
