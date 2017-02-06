def news_pull
  url = URI.parse('http://mho.qq.com/webplat/info/news_version3/5499/5500/5501/m4027/list_1.shtml')
  req = Net::HTTP.new(url.host, url.port)
  begin
    req = Net::HTTP.get_response(url)
  rescue StandardError
    req = false
  end
  if req != false
    $currentnews = open(url).read
    $currentnews.gsub!(/.*?(?=<ul class="newsList">)/im, '')
    $currentnews.delete! "\s"
    File.write('botfiles/newnews', $currentnews)
    puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][NEWS] News Gathered!"
  else
    puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][NEWS] Can't " \
         'connect to news!'
  end
end

def news_post
  $news = load_json('botfiles/oldnews.json')
  $news2 = getline('botfiles/newnews', 2)
  $news2 = $news2.chars.select(&:valid_encoding?).join
  $news2date = $news2[/#{"<li><span>"}(.*?)#{"</span>"}/m, 1]
  $news2link = $news2[/#{"a><ahref=\""}(.*?)#{"\"target"}/m, 1]
  $news3 = getline('botfiles/newnews', 3)
  $news3 = $news3.chars.select(&:valid_encoding?).join
  $news3date = $news3[/#{"<li><span>"}(.*?)#{"</span>"}/m, 1]
  $news3link = $news3[/#{"a><ahref=\""}(.*?)#{"\"target"}/m, 1]
  $news4 = getline('botfiles/newnews', 4)
  $news4 = $news4.chars.select(&:valid_encoding?).join
  $news4date = $news4[/#{"<li><span>"}(.*?)#{"</span>"}/m, 1]
  $news4link = $news4[/#{"a><ahref=\""}(.*?)#{"\"target"}/m, 1]
  $news5 = getline('botfiles/newnews', 5)
  $news5 = $news5.chars.select(&:valid_encoding?).join
  $news5date = $news5[/#{"<li><span>"}(.*?)#{"</span>"}/m, 1]
  $news5link = $news5[/#{"a><ahref=\""}(.*?)#{"\"target"}/m, 1]
  $news6 = getline('botfiles/newnews', 6)
  $news6 = $news6.chars.select(&:valid_encoding?).join
  $news6date = $news6[/#{"<li><span>"}(.*?)#{"</span>"}/m, 1]
  $news6link = $news6[/#{"a><ahref=\""}(.*?)#{"\"target"}/m, 1]

  unless $news.include? $news6date + ' | ' + $news6link
    $news.push($news6date + ' | ' + $news6link)
    $qqnews.each do |key, _array|
      begin
        BOT.send_message(key, "#{$news6date} | <http://mho.qq.com#{$news6link}>")
      rescue
      end
    end
    File.open('botfiles/oldnews.json', 'w') { |f| f.write $news.to_json }
  end
  unless $news.include? $news5date + ' | ' + $news5link
    $news.push($news5date + ' | ' + $news5link)
    $qqnews.each do |key, _array|
      begin
        BOT.send_message(key, "#{$news5date} | <http://mho.qq.com#{$news5link}>")
      rescue
      end
    end
    File.open('botfiles/oldnews.json', 'w') { |f| f.write $news.to_json }
  end
  unless $news.include? $news4date + ' | ' + $news4link
    $news.push($news4date + ' | ' + $news4link)
    $qqnews.each do |key, _array|
      begin
        BOT.send_message(key, "#{$news4date} | <http://mho.qq.com#{$news4link}>")
      rescue
      end
    end
    File.open('botfiles/oldnews.json', 'w') { |f| f.write $news.to_json }
  end
  unless $news.include? $news3date + ' | ' + $news3link
    $news.push($news3date + ' | ' + $news3link)
    $qqnews.each do |key, _array|
      begin
        BOT.send_message(key, "#{$news3date} | <http://mho.qq.com#{$news3link}>")
      rescue
      end
    end
    File.open('botfiles/oldnews.json', 'w') { |f| f.write $news.to_json }
  end
  unless $news.include? $news2date + ' | ' + $news2link
    $news.push($news2date + ' | ' + $news2link)
    $qqnews.each do |key, _array|
      begin
        BOT.send_message(key, "#{$news2date} | <http://mho.qq.com#{$news2link}>")
      rescue
      end
    end
    File.open('botfiles/oldnews.json', 'w') { |f| f.write $news.to_json }
  end
  puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][NEWS] News posted!"
end
