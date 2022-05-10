class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    PassedTest.create(test: @test, user: current_user)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

end
