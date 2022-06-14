class PassedTestController < ApplicationController

  before_action :authenticate_user!
  before_action :set_passed_test, only: %i[show update result gist]

  def show;end

  def result;end

  def update
    @passed_test.accept!(params[:answer_ids])

    if @passed_test.completed?
      # moved to passed_test model callback
      # TestsMailer.completed_test(@passed_test).deliver_now
      give_badge if @passed_test.success?
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

  def give_badge
    badges = BadgeService.new(@passed_test).call
    current_user.badges << badges
    flash[:notice] = 'You have new badges, check it on badge page' if badges
  end
end
