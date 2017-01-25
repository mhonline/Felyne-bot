def debug(line, message)
  if $settings['debug']
    puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][DEBUG][#{line}]
    #{message}"
  end
end
