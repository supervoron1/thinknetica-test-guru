class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback)
    @feedback = feedback

    mail to: ENV['ADMIN_EMAIL']
  end
end
