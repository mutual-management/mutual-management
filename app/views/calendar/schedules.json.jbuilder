json.array!(@schedules) do |schedule|
  json.id schedule.id
  json.start schedule.date + " " + schedule.time
  json.title schedule.title
  json.color Schedule.labelColors.key(schedule.label_color)
end