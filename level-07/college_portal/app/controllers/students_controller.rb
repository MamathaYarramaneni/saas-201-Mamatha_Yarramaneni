class StudentsController < ApplicationController
  def index
    if params[:department_id].present? && params[:section_id].present?
      @students = Student.where(department_id: params[:department_id],section_id: params[:section_id]).all
    else
      @students = Student.all
    end
  end
  def show
      @student = Student.where(id: params[:id])	
      @department=Department.all
      @sectionval=Section.all
  end
  
  def new
      @student=Student.new
      @department_collection=Department.all.collect { |p| [p.name, p.id] }
      @section_collection=Section.all.collect { |p| [p.name, p.id , p.department_id] }
  end
  def create
      @student = Student.new(student_params)

    if @student.save
      redirect_to action: "index"
    else
      flash[:danger] = @student.errors.values.join(', ')
      redirect_to action: "new"
    end
  end

  private

  def student_params
    params[:student].permit( :name,:roll_no, :email, :section_id, :department_id)
  end
end

