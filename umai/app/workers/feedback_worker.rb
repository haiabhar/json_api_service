require 'sidekiq-scheduler'
class FeedbackWorker
	include Sidekiq::Worker

	def perform
		#p "=============== Do the activities ======================"
		
	end

end