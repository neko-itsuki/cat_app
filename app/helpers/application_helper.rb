module ApplicationHelper
	
	def full_title(page_title = '')
		base_title = "保護犬、保護猫の譲渡里親マッチングサイト"
		if page_title.empty? || page_title == 'Home'
			base_title
		else
			page_title + "|" + base_title
		end
	end
	
end
