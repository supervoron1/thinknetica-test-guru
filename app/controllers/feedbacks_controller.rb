class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)

    if @feedback.save
      FeedbacksMailer.send_feedback(@feedback).deliver_now
      redirect_to tests_path, notice: t('.sent')
    else
      :new
    end

  end

  private

  def feedback_params
    params.require(:feedback).permit(:text)
  end
end
