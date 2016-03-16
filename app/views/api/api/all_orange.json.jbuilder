json.buses @buses do |bus|
  json.name     bus.name
  json.kind     bus.kind
  json.special  bus.special
  json.note     bus.note
  json.depart   bus.depart.strftime("%H:%M")
end
json.status do
  json.code 200
  json.message 'ok'
end