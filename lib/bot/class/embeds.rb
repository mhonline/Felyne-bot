def list_raids(raids, channel)
    o = ""
    x = 0
    y = 1
    begin
            o += "**Reminder #{y}:** #{raids[x+1]} @ #{raids[x]}\n"
            x += 2
            y += 1
    end while x < raids.length
	e = Discordrb::Webhooks::Embed.new
	e.author = {
		name: "Raids for #{channel}"
	}
	e.color = 0x673ab7
	e.description = o
	e.footer = { text: channel }
	e.timestamp = Time.now
	e
end