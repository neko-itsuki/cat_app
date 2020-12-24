require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup 
		@base_title = "保護犬、保護猫の譲渡里親マッチングサイト"
  end
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "保護犬、保護猫の譲渡里親マッチングサイト"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title","About|#{@base_title}"
  end


  test "should get description" do
    get description_path
    assert_response:success
    assert_select "title","Description|#{@base_title}"
  end
  
  test "should get flow" do
    get flow_path
    assert_response:success
    assert_select "title","Flow|#{@base_title}"
  end
  
  test "should get action" do
    get action_path
    assert_response:success
    assert_select "title","Action|#{@base_title}"
  end
  
  test "should get hospital" do
    get hospital_path
    assert_response:success
    assert_select "title","Hospital|#{@base_title}"
  end

end