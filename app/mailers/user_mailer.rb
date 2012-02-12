class UserMailer < ActionMailer::Base
default :from => "russ.himelein@gmail.com"

	def feed_notification(user)
		@user = user
		mail(:to => "#{user.name} <#{user.email}>", :subject => "New Pickup")
	
	end
end