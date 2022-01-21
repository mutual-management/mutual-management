json.array!(@schedules) do |schedule|
  puts "feijwfoijwieoj"
  json.id schedule.id
  json.start schedule.date + schedule.time
  json.end schedule.date + schedule.time
  json.title schedule.title
  json.color Schedule.labelColors.key(event.label_color)
end