class TestsMailer < ApplicationMailer

  def completed_test(passed_test)
    @user = passed_test.user
    @test = passed_test.test

    mail to: @user.email # subject is in localization entity available thru naming conventions
  end
end
