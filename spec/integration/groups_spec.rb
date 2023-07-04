require 'rails_helper'

RSpec.describe Group, type: :system do
  include Devise::Test::IntegrationHelpers
  user = User.create!(name: 'john', email: "john#{Random.rand(1...1000)}@example.com", password: 'password')

  subject do
    Group.new(user_id: user.id, name: 'test',
              icon: Rack::Test::UploadedFile.new('app/assets/images/burger.png', 'burger/png'))
  end
  before do
    login_as(user, scope: :user)
    subject.save
  end

  describe 'index page' do
    it "I can see the group's name" do
      visit root_path
      expect(page).to have_content(subject.name)
    end

    it "I can see the group's icon." do
      visit root_path
      expect(page).to have_content('Add New Category')
    end

    it "When I click on a post, it redirects me to that post's show page." do
      visit root_path
      click_on subject.name
      visit category_transaction_index_path(subject.id)
      Category.create!(user_id: user.id, name: 'test_1', amount: 10)
      expect(page).to have_content('Add New Transaction')
    end
  end
end
