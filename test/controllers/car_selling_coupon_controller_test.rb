require 'test_helper'

class CarSellingCouponControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get car_selling_coupon_index_url
    assert_response :success
  end

  test "should get payment" do
    get car_selling_coupon_payment_url
    assert_response :success
  end

  test "should get contact" do
    get car_selling_coupon_contact_url
    assert_response :success
  end

  test "should get thanks" do
    get car_selling_coupon_thanks_url
    assert_response :success
  end

end
