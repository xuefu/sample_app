require 'faker'
FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }
		password "xtiprfw"
		password_confirmation "xtiprfw"
	end

	factory :admin do
		admin true
	end

	factory :micropost do
		content "Lorem ipsum"
		user
	end
end
