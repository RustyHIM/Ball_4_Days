module ApplicationHelper

	def title
		base_title = "Ball4Days"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
	
	def logo
		image_tag("logo.png", :alt => "Ball4Days", :class => "round")
	end
end