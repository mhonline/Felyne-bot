def news_pull
	url = URI.parse("http://mh0.qq.com/webplat/info/news_version3/5499/5500/5501/m4027/list_1.shtml")
	req = Net::HTTP.new(url.host, url.port)
	begin
		res = req.request_head(url.path)
	rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError, Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
	end
	puts res
	#	$currentnews = open(url).read
	#	$currentnews.gsub!(/.*?(?=<ul class="newsList">)/im, "")
	#	$currentnews.delete! "\s"
	#	File.write('bot/newnews', $currentnews)
	#	puts "News gathered!"
	
	#	puts "Can't Connect to news!"
	
end