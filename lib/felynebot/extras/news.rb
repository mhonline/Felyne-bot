def news_pull
	url = URI.parse("http://mh0.qq.com/webplat/info/news_version3/5499/5500/5501/m4027/list_1.shtml")
	req = Net::HTTP.new(url.host, url.port)
	begin
  		res = Net::HTTP.get_response(url)
	rescue StandardError
		res = false
	end
	if res != false
		$currentnews = open(url).read
		$currentnews.gsub!(/.*?(?=<ul class="newsList">)/im, "")
		$currentnews.delete! "\s"
		File.write('bot/newnews', $currentnews)
		puts "News gathered!"
	else
		puts "Can't Connect to news!"
	end
end