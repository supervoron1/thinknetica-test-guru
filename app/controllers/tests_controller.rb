class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy start]
  before_action :set_user, only: :start

  def index
    @tests = Test.all
  end

  def show; end

  # New -> Create
  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to root_path
    else
      render :new # Just rendering view '/tests/new' using @test (action #new not used)
    end
  end

  # Edit -> Update
  def edit; end

  def update
    if @test.update(test_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    # @user.tests.push(@test)
    PassedTest.create(test_id: @test.id, user_id: @user.id )
    redirect_to @user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.last
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
