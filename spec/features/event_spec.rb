require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
    login_as(@user, :scope => :user)
  end
  describe 'index' do
    before do
      visit events_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end
    it 'has a list of events' do
      event1 = Event.create(title: "Valor", date: Date.today, photo: "valor-logo.jpg", user_id: @user.id)
      event2 = Event.create(title: "Wizards", date: Date.today, photo: "valor-logo.jpg", user_id: @user.id)
      visit events_path

      expect(page).to have_content(/Valor|Wizards/)
    end
  end
end
describe 'creation' do
  before do
    @user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
    login_as(@user, :scope => :user)
     visit new_event_path
  end
  it 'has a new form that can be reached' do
    expect(page.status_code).to eq(200)
  end
  it 'can be created from new form page' do
    fill_in 'event[title]', with: "Valor event"
    fill_in 'event[date]', with: Date.today
    fill_in 'event[photo]', with: "valor-logo.jpg"
    
    click_on "Save"

    expect(page).to have_content("Valor event")
  end

  it 'will have a user associated with it' do
    fill_in 'event[title]', with: "User Association"
    fill_in 'event[date]', with: Date.today
    fill_in 'event[photo]', with: "valor-logo.jpg"
    
    click_on "Save"

    expect(User.last.events.last.title).to eq("User Association")

  end
end