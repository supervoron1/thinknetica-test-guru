class PassedTestController < ApplicationController

  before_action :set_passed_test, only: %i[show update result]

  def show

  end

  def result

  end

  def update
    @passed_test.accept!(params[:answer_ids])

    if @passed_test.completed?
      redirect_to result_passed_test_path(@passed_test)
    else
      render :show
    end
  end

  private

  def set_passed_test
    @passed_test = PassedTest.find(params[:id])
  end
end
