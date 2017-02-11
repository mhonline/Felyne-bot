def load_json(file_location)
  if File.exist?(file_location)
    begin
      ar = {}
      ar = JSON.parse File.read file_location
    rescue
      ar = {}
    end
  else
    ar = {}
    puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][LOADER] No file " \
         "#{file_location} to load!"
  end
  puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][LOADER] " \
       "#{file_location} loaded!"
  ar
end

def load_permissions(file_location)
  if File.exist?(file_location)
    begin
      ar = {}
      ar = JSON.parse File.read file_location
    rescue
      ar = {}
    end
  else
    ar = {}
    puts '[#{Time.now.strftime("%d %a %y | %H:%M:%S")}][LOADER] You have not ' \
         'set up any permissions'
    puts '[LOADER] Please enter your user id to set admin permissions for you' \
         'r discord account'
    user_id = $stdin.gets.chomp.to_i
    ar[user_id] = { 'id' => user_id.to_i, 'lvl' => 999 }
    File.open(file_location, 'w') { |f| f.write ar.to_json }
    puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][LOADER] Permissions s" \
         'aved!'
  end
  puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][LOADER] " \
       "#{file_location} loaded!"
  ar
end

def getline(loc, line)
  if File.exist?(loc)
    f = File.open(loc, 'r')
    line.times { f.gets }
    $temp = $LAST_READ_LINE
    f.close
    $temp
  else
    puts 'No file to open!'
  end
end
