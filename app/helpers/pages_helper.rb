module PagesHelper
	def render_tags_as_links(taglist)
		taglist.gsub(/\w+/){|t| link_to t, "/posts/tag/#{t}"}.html_safe
	end
end
