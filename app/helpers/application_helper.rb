module ApplicationHelper
	#returns the full title on a per-page basis.
	def full_title(page_title = '')
		base_title = "CalledOut App"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	def link_to_micro_image(image_path, target_link, options={})
		link_to(image_tag(image_path, class: 'img micro-img'), target_link, options)
	end

end
