require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	
	test "layput links" do
	get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", description_path
    assert_select "a[href=?]", flow_path
    assert_select "a[href=?]", action_path
    assert_select "a[href=?]", hospital_path
    assert_select "a[href=?]", privacy_path
    assert_select "a[href=?]", rule_path
    assert_select "a[href=?]", sitemap_path
	end
	
end
