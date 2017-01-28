def embed(e_name, e_desc)
  Discordrb::Webhooks::Embed.new(
    author: { name: e_name },
    color: rand(0xffffff),
    description: e_desc,
    timestamp: Time.now
  )
end
