module ApplicationHelper
	def stars(numStar)
		return ((image_tag "star.png", :size => "20x20") * numStar).html_safe
	end
	def is_admin?
		return current_user.try(:admin?)
	end
end
