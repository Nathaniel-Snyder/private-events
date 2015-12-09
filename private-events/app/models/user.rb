class User < ActiveRecord::Base
	validates :name, uniqueness: :true

	has_many :events, 			:foreign_key => :creator_id

	has_many :invites, 			:foreign_key => :attendee_id
	has_many :attended_events, 	:through => :invites

	def upcoming_events
		self.events.upcoming 
	end

	def past_events
		self.events.past 
	end
end
