class EventsController < ApplicationController

	def new
		@event = current_user.events.build
	end

	def create
		@event = current_user.events.build(event_params)
		if @event.save
			redirect_to current_user
		else
			render 'new'
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	def index
		@events = Event.all
	end

	private

	def event_params
		params.require(:event).permit(:description, :name, :date)
	end
end
