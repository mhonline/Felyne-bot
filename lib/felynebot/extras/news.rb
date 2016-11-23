def news_pull
	begin
		$currentnews = open('http://mh0.qq.com/webplat/info/news_version3/5499/5500/5501/m4027/list_1.shtml').read
		#$currentnews.gsub!(/.*?(?=<ul class="newsList">)/im, "")
		#$currentnews.delete! "\s"
		#File.write('bot/newnews', $currentnews)
		#puts "News gathered!"
	rescue OpenURI::HTTPError => ex
		puts "News url invalid"
	end
end