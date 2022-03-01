class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @students = current_user.students
  end

  def dashboard
    @user = current_user
  end

private

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end

end
