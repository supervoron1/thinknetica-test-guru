class PassedTestController < ApplicationController

  before_action :authenticate_user!
  before_action :set_passed_test, only: %i[show update result gist]

  def show;end

  def result;end

  def update
    @passed_test.accept!(params[:answer_ids])

    if @passed_test.completed? || @passed_test.time_expired?
      badges = AssignBadgeService.new(@passed_test).call if @passed_test.success?
      flash[:notice] = 'You have new badges, check it on badge page' unless badges.empty?
      redirect_to result_passed_test_path(@passed_test)
    else
      render :show
    end
  end

  def gist
    question = @passed_test.current_question
    service = GistQuestionService.new(question)
    result = service.call

    flash_options = if service.success?
                      html_url = result.html_url
                      current_user.gists.create(question: question, url: html_url)
                      { notice: t('.success', gist_url: html_url) }
                    else
                      { notice: t('.failure') }
                    end
    redirect_to @passed_test, flash_options
  end

  private

  def set_passed_test
    @passed_test = PassedTest.find(params[:id])
  end

end
