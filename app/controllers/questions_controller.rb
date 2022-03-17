class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[index create]

  def index
    render inline: "<%= @test.questions.map(&:body).join(', ') %>"
  end

  def show
    render inline: "<%= @question.body %>"
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
end
