namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		 admin = User.create!(name: "xuefu", 
			     email: "xuefu.sh@163.com", 
			     password: "xtiprfw",
			     password_confirmation: "xtiprfw")
		 admin.toggle!(:admin)

		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@railstutorial.org"
			password = "password"
			User.create!(name: name, 
				     email: email,
				     password: password,
				     password_confirmation: password)
		end
	end
end
