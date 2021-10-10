
now = Time.now
current_hour = now.hour
current_hour_and_minute = now.strftime('%H:%M')

current_time_status =
  case current_hour
  when (0...6)
    'Zzz'
  when (6...12)
    'Good Morning'
  when (12...18)
    'Good Afternoon'
  else
    'Good Evening'
  end

puts "Your current time is #{current_hour_and_minute} #{current_time_status}"
