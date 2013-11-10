require 'test_helper'

class TransitScoresControllerTest < ActionController::TestCase
  setup do
    @transit_score = transit_scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transit_scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transit_score" do
    assert_difference('TransitScore.count') do
      post :create, transit_score: { cityName: @transit_score.cityName, latitude: @transit_score.latitude, longitude: @transit_score.longitude, stateName: @transit_score.stateName, transit_score: @transit_score.transit_score }
    end

    assert_redirected_to transit_score_path(assigns(:transit_score))
  end

  test "should show transit_score" do
    get :show, id: @transit_score
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transit_score
    assert_response :success
  end

  test "should update transit_score" do
    put :update, id: @transit_score, transit_score: { cityName: @transit_score.cityName, latitude: @transit_score.latitude, longitude: @transit_score.longitude, stateName: @transit_score.stateName, transit_score: @transit_score.transit_score }
    assert_redirected_to transit_score_path(assigns(:transit_score))
  end

  test "should destroy transit_score" do
    assert_difference('TransitScore.count', -1) do
      delete :destroy, id: @transit_score
    end

    assert_redirected_to transit_scores_path
  end
end
