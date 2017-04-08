require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Creation' do
  	before do
		@event = Event.create(title: "title", date: Date.today, photo: "photo.png")
  	end
  	it 'can be created' do
  		expect(@event).to be_valid
  	end
  	it 'cannot be created without a title and photo' do
  		@event.title = nil
  		@event.date = nil
  		@event.photo = nil
  		expect(@event).to_not be_valid
  	end
  end
end
