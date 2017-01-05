def list_raids(raids, channel)
    o = ""
    x = 0
    y = 1
    begin
            o += "**Raid #{y}:** #{raids[x+1].chomp(' is starting *now*!')} @ #{raids[x]}\n"
            x += 10
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
