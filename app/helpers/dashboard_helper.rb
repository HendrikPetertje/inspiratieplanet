module DashboardHelper

	def render_userpic
		if current_user.avatar_url(:thumb) === nil
			default_url
		else
			current_user.avatar_url(:thumb)
		end
	end

end
