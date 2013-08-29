=begin
require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get static_pages_index_path
      response.status.should be(200)
    end
  end
end
=end

require 'spec_helper'

describe "Static pages" do

	subject { page }

	let(:base_title) {"Ruby On Rails Tutorial Sample App"}

	describe "Home pages" do
		before { visit root_path }

		it { should have_selector 'h1', text: 'Sample App' }
		it { should have_selector 'title', text: full_title('') }
		it { should_not have_selector 'title', text: '| Home' }

	end

	describe "Help page" do
		before { visit help_path }

		it { should have_selector 'h1', text: 'Help' }
		it { should have_selector 'title', text: full_title('Help') }

	end
	
	describe "About page" do 
		before { visit about_path }

		it { should have_selector('h1', text: 'About') }
		it { should have_selector('title', text: full_title('About Us')) }
		end

	describe "Contact page" do
		before { visit contact_path }

		it { should have_selector 'h1', text: 'Contact' }
		it { should have_selector 'title', text: full_title('Contact') }
	end	

	describe "for signed-in users" do
		let(:user) { FactoryGirl.create(:user) }
		before do
			FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
			FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
			sign_in user
			visit root_path
		end

		it "should render the user's feed" do
			user.feed.each do |item|
				page.should have_selector "li##{item.id}", text: item.content
			end
		end

		describe "follower/following counts" do
			let(:other_user) { FactoryGirl.create(:user) }
			before do
				other_user.follow!(user)
				visit root_path
			end

			it { should have_link("0 following", href: following_user_path(user)) }
			it { should have_link("1 follower", href: follower_user_path(user)) }
		end

	end
end
