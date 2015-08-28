require 'faker'

status = ['private', 'viewable','open', 'public', 'restricted']
done = [true, false]
# User
10.times do
	user = User.new(
		username: Faker::Internet.user_name,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email,
		password: Faker::Internet.password(8)
	)
	user.save!
end

user = User.new(
		username: "junko",
		first_name: "Yes",
		last_name: "No",
		email: "aliciajace@gmail.com",
		password: "password"
	)
user.save!
users = User.all

# List
20.times do
  list = List.new(
   title: Faker::Hacker.verb,
   permissions: status.sample,
   user: users.sample
  )
  list.save!
end
lists = List.all

# Item
40.times do
  item = Item.new(
    todo: Faker::Team.creature,
    memo: Faker::Lorem.sentence,
    complete: done.sample,
    list: lists.sample
  )
  item.save!
end


puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"