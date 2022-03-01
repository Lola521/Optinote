class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    student = Student.find(params[:id])
    student.update(student_params)

    redirect_to students_path
  end

  def index
    @user = current_user
    @students = @user.students
  end

  def new
    @student = Student.new
  end

  def create
    student = Student.new(student_params)
    student.user_id = current_user.id
      if student.save!
        redirect_to students_path(current_user), notice: "eleve creee #{student.first_name} #{student.last_name}"
      else
        render :new
      end
  end

  def destroy
      student = Student.find(params[:id])
      student.destroy
      redirect_to students_path
  end
  # def show
  #   @student = Student.find(params[:id])
  #   @observation = Observation.where(student_id: @student.id)
  #   @observations = @student.observations.sort do |obs_a, obs_b|
  #   obs_b.creation_date <=> obs_a.creation_date
  #   end
  # end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end
end
