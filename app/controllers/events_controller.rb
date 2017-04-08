class EventsController < ApplicationController
	before_action :set_event, only: [:show]
	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		@event.user_id = current_user.id
		
		if @event.save
			redirect_to @event, notice: "Your event was created successfully"
		else
			render :new
		end
	end

	def show
	end

private
	
	def event_params
		params.require(:event).permit(:title, :date, :photo)	
	end

	def set_event
		@event = Event.find(params[:id])
	end
end
