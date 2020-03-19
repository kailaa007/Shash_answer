json.visits @data do |data|
	json.extract! data, :id, :evid, :vendor_site_id, :vendor_visit_id, :visit_ip, :vendor_visitor_id
	json.page_views data.page_views do |page_view|
		json.extract! page_view, :id, :visit_id, :position, :url, :time_spent, :timestamp
	end
end
