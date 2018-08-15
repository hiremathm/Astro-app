require 'test_helper'

class BasicHeroscopesControllerTest < ActionController::TestCase
  setup do
    @basic_heroscope = basic_heroscopes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:basic_heroscopes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basic_heroscope" do
    assert_difference('BasicHeroscope.count') do
      post :create, basic_heroscope: { ascendant: @basic_heroscope.ascendant, charan: @basic_heroscope.charan, day: @basic_heroscope.day, gana: @basic_heroscope.gana, hour: @basic_heroscope.hour, karan: @basic_heroscope.karan, lat: @basic_heroscope.lat, lon: @basic_heroscope.lon, min: @basic_heroscope.min, month: @basic_heroscope.month, nadi: @basic_heroscope.nadi, nakshtra: @basic_heroscope.nakshtra, nakshtra_adipathi: @basic_heroscope.nakshtra_adipathi, name_alphabet: @basic_heroscope.name_alphabet, paya: @basic_heroscope.paya, rashi/sign: @basic_heroscope.rashi/sign, rashi_adipathi: @basic_heroscope.rashi_adipathi, tatva: @basic_heroscope.tatva, tithi: @basic_heroscope.tithi, tzone: @basic_heroscope.tzone, varna: @basic_heroscope.varna, vashya: @basic_heroscope.vashya, year: @basic_heroscope.year, yog: @basic_heroscope.yog, yoni: @basic_heroscope.yoni, yunja: @basic_heroscope.yunja }
    end

    assert_redirected_to basic_heroscope_path(assigns(:basic_heroscope))
  end

  test "should show basic_heroscope" do
    get :show, id: @basic_heroscope
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @basic_heroscope
    assert_response :success
  end

  test "should update basic_heroscope" do
    patch :update, id: @basic_heroscope, basic_heroscope: { ascendant: @basic_heroscope.ascendant, charan: @basic_heroscope.charan, day: @basic_heroscope.day, gana: @basic_heroscope.gana, hour: @basic_heroscope.hour, karan: @basic_heroscope.karan, lat: @basic_heroscope.lat, lon: @basic_heroscope.lon, min: @basic_heroscope.min, month: @basic_heroscope.month, nadi: @basic_heroscope.nadi, nakshtra: @basic_heroscope.nakshtra, nakshtra_adipathi: @basic_heroscope.nakshtra_adipathi, name_alphabet: @basic_heroscope.name_alphabet, paya: @basic_heroscope.paya, rashi/sign: @basic_heroscope.rashi/sign, rashi_adipathi: @basic_heroscope.rashi_adipathi, tatva: @basic_heroscope.tatva, tithi: @basic_heroscope.tithi, tzone: @basic_heroscope.tzone, varna: @basic_heroscope.varna, vashya: @basic_heroscope.vashya, year: @basic_heroscope.year, yog: @basic_heroscope.yog, yoni: @basic_heroscope.yoni, yunja: @basic_heroscope.yunja }
    assert_redirected_to basic_heroscope_path(assigns(:basic_heroscope))
  end

  test "should destroy basic_heroscope" do
    assert_difference('BasicHeroscope.count', -1) do
      delete :destroy, id: @basic_heroscope
    end

    assert_redirected_to basic_heroscopes_path
  end
end
