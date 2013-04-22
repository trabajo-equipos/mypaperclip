require 'test_helper'

class InstructoresControllerTest < ActionController::TestCase
  setup do
    @instructor = instructores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instructores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instructor" do
    assert_difference('Instructor.count') do
      post :create, instructor: { cedula: @instructor.cedula, direccion: @instructor.direccion, email: @instructor.email, nombre: @instructor.nombre }
    end

    assert_redirected_to instructor_path(assigns(:instructor))
  end

  test "should show instructor" do
    get :show, id: @instructor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instructor
    assert_response :success
  end

  test "should update instructor" do
    put :update, id: @instructor, instructor: { cedula: @instructor.cedula, direccion: @instructor.direccion, email: @instructor.email, nombre: @instructor.nombre }
    assert_redirected_to instructor_path(assigns(:instructor))
  end

  test "should destroy instructor" do
    assert_difference('Instructor.count', -1) do
      delete :destroy, id: @instructor
    end

    assert_redirected_to instructores_path
  end
end
