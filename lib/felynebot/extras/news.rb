def news_pull
	url = URI.parse("http://mho.qq.com/webplat/info/news_version3/5499/5500/5501/m4027/list_1.shtml")
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

def news_post
	$news = getline("bot/oldnews",1).split(",")
	$news2 = getline("bot/newnews",2)
	$news2 = $news2.chars.select(&:valid_encoding?).join
	$news2date = $news2[/#{"<li><span>"}(.*?)#{"</span>"}/m, 1]
	$news2link = $news2[/#{"a><ahref=\""}(.*?)#{"\"target"}/m, 1]
	$news3 = getline("bot/newnews",3)
	$news3 = $news3.chars.select(&:valid_encoding?).join
	$news3date = $news3[/#{"<li><span>"}(.*?)#{"</span>"}/m, 1]
	$news3link = $news3[/#{"a><ahref=\""}(.*?)#{"\"target"}/m, 1]
	$news4 = getline("bot/newnews",4)
	$news4 = $news4.chars.select(&:valid_encoding?).join
	$news4date = $news4[/#{"<li><span>"}(.*?)#{"</span>"}/m, 1]
	$news4link = $news4[/#{"a><ahref=\""}(.*?)#{"\"target"}/m, 1]
	$news5 = getline("bot/newnews",5)
	$news5 = $news5.chars.select(&:valid_encoding?).join
	$news5date = $news5[/#{"<li><span>"}(.*?)#{"</span>"}/m, 1]
	$news5link = $news5[/#{"a><ahref=\""}(.*?)#{"\"target"}/m, 1]
	$news6 = getline("bot/newnews",6)
	$news6 = $news6.chars.select(&:valid_encoding?).join
	$news6date = $news6[/#{"<li><span>"}(.*?)#{"</span>"}/m, 1]
	$news6link = $news6[/#{"a><ahref=\""}(.*?)#{"\"target"}/m, 1]

	if !$news.include? $news6date + " | " + $news6link
		$news.push($news6date + " | " + $news6link)
		$bot.send_message(126766276038230016, "#{$news6date} | http://mho.qq.com#{$news6link}")
		$news1 = $news.join(",").gsub("\n","")
		File.write("bot/oldnews", $news1)
	end
	if !$news.include? $news5date + " | " + $news5link
		$news.push($news5date + " | " + $news5link)
		$bot.send_message(126766276038230016, "#{$news5date} | http://mho.qq.com#{$news5link}")
		$news1 = $news.join(",").gsub("\n","")
		File.write("bot/oldnews", $news1)
	end
	if !$news.include? $news4date + " | " + $news4link
		$news.push($news4date + " | " + $news4link)
		$bot.send_message(126766276038230016, "#{$news4date} | http://mho.qq.com#{$news4link}")
		$news1 = $news.join(",").gsub("\n","")
		File.write("bot/oldnews", $news1)
	end
	if !$news.include? $news3date + " | " + $news3link
		$news.push($news3date + " | " + $news3link)
		$bot.send_message(126766276038230016, "#{$news3date} | http://mho.qq.com#{$news3link}")
		$news1 = $news.join(",").gsub("\n","")
		File.write("bot/oldnews", $news1)
	end
	if !$news.include? $news2date + " | " + $news2link
		$news.push($news2date + " | " + $news2link)
		$bot.send_message(126766276038230016, "#{$news2date} | http://mho.qq.com#{$news2link}")
		$news1 = $news.join(",").gsub("\n","")
		File.write("bot/oldnews", $news1)
	end
	puts 'News Posted!'
end