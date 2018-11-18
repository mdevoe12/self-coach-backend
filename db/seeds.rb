# Base seeds file for example data

user = User.create(email: 'johndoe@sample.com', password: 'notpassword', firstname: 'John', lastname: 'Doe')

main_lifts = {
  'Squat' => 'BS',
  'Deadlift' => 'DL',
  'Press' => 'OHP',
  'Bench' => 'BP'
}
# outer loop to create four main lifts
main_lifts.each do |k, v|
  item = user.items.create(name: k, abbreviation: v)
  # inner loop creates fake data for each lift
  data_number = 100
  30.times do |n|
    item.entries.create(date: (DateTime.now - (30 - n)), data: data_number)
    data_number += 1
  end
end
