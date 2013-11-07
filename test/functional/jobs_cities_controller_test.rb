require 'test_helper'

class JobsCitiesControllerTest < ActionController::TestCase
  setup do
    @jobs_city = jobs_cities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobs_cities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jobs_city" do
    assert_difference('JobsCity.count') do
      post :create, jobs_city: { cityName: @jobs_city.cityName, latitude: @jobs_city.latitude, longitude: @jobs_city.longitude, numberJobs: @jobs_city.numberJobs, population: @jobs_city.population, stateName: @jobs_city.stateName }
    end

    assert_redirected_to jobs_city_path(assigns(:jobs_city))
  end

  test "should show jobs_city" do
    get :show, id: @jobs_city
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jobs_city
    assert_response :success
  end

  test "should update jobs_city" do
    put :update, id: @jobs_city, jobs_city: { cityName: @jobs_city.cityName, latitude: @jobs_city.latitude, longitude: @jobs_city.longitude, numberJobs: @jobs_city.numberJobs, population: @jobs_city.population, stateName: @jobs_city.stateName }
    assert_redirected_to jobs_city_path(assigns(:jobs_city))
  end

  test "should destroy jobs_city" do
    assert_difference('JobsCity.count', -1) do
      delete :destroy, id: @jobs_city
    end

    assert_redirected_to jobs_cities_path
  end
end
