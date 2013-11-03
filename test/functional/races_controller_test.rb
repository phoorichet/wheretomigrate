require 'test_helper'

class RacesControllerTest < ActionController::TestCase
  setup do
    @race = races(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:races)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create race" do
    assert_difference('Race.count') do
      post :create, race: { bangladeshi: @race.bangladeshi, bhutanese: @race.bhutanese, cambodian: @race.cambodian, chinese: @race.chinese, filipino: @race.filipino, hmong: @race.hmong, indian: @race.indian, indonesian: @race.indonesian, japanese: @race.japanese, korean: @race.korean, laotian: @race.laotian, malaysian: @race.malaysian, nepalese: @race.nepalese, pakistani: @race.pakistani, srilankan: @race.srilankan, taiwanese: @race.taiwanese, thai: @race.thai, vietnamese: @race.vietnamese }
    end

    assert_redirected_to race_path(assigns(:race))
  end

  test "should show race" do
    get :show, id: @race
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @race
    assert_response :success
  end

  test "should update race" do
    put :update, id: @race, race: { bangladeshi: @race.bangladeshi, bhutanese: @race.bhutanese, cambodian: @race.cambodian, chinese: @race.chinese, filipino: @race.filipino, hmong: @race.hmong, indian: @race.indian, indonesian: @race.indonesian, japanese: @race.japanese, korean: @race.korean, laotian: @race.laotian, malaysian: @race.malaysian, nepalese: @race.nepalese, pakistani: @race.pakistani, srilankan: @race.srilankan, taiwanese: @race.taiwanese, thai: @race.thai, vietnamese: @race.vietnamese }
    assert_redirected_to race_path(assigns(:race))
  end

  test "should destroy race" do
    assert_difference('Race.count', -1) do
      delete :destroy, id: @race
    end

    assert_redirected_to races_path
  end
end
