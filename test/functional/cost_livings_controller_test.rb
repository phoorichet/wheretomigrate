require 'test_helper'

class CostLivingsControllerTest < ActionController::TestCase
  setup do
    @cost_living = cost_livings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cost_livings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cost_living" do
    assert_difference('CostLiving.count') do
      post :create, cost_living: { cityName: @cost_living.cityName, compositeIndex: @cost_living.compositeIndex, groceryItems: @cost_living.groceryItems, healthcare: @cost_living.healthcare, housing: @cost_living.housing, lat: @cost_living.lat, long: @cost_living.long, size: @cost_living.size, transportation: @cost_living.transportation, utilities: @cost_living.utilities }
    end

    assert_redirected_to cost_living_path(assigns(:cost_living))
  end

  test "should show cost_living" do
    get :show, id: @cost_living
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cost_living
    assert_response :success
  end

  test "should update cost_living" do
    put :update, id: @cost_living, cost_living: { cityName: @cost_living.cityName, compositeIndex: @cost_living.compositeIndex, groceryItems: @cost_living.groceryItems, healthcare: @cost_living.healthcare, housing: @cost_living.housing, lat: @cost_living.lat, long: @cost_living.long, size: @cost_living.size, transportation: @cost_living.transportation, utilities: @cost_living.utilities }
    assert_redirected_to cost_living_path(assigns(:cost_living))
  end

  test "should destroy cost_living" do
    assert_difference('CostLiving.count', -1) do
      delete :destroy, id: @cost_living
    end

    assert_redirected_to cost_livings_path
  end
end
