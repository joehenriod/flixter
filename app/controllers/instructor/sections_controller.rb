class Instructor::SectionsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course, :only => [:create]
  before_action :require_authorized_for_current_section, :only => [:update]

	def new
		@course = Course.find(params[:course_id])
		@section = Section.new
	end

	 def create
    @course = Course.find(params[:course_id])
    @section = @course.sections.create(section_params)
    redirect_to instructor_course_path(@course)
  end

  def update
    current_section.update_attributes(section_params)
    render :text => 'updated!'
  end

  private

  def section_params
    params.require(:section).permit(:title, :row_order_position)
  end
  
end
