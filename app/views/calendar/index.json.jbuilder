json.array!(@events) do |event|
  puts "feijwfoijwieoj"
  json.id event.id
  json.start event.date + event.time
  json.end event.date + event.time
  json.title event.title
  # json.color Schedule.labelColors.key(event.label_color)
end