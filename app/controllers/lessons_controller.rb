class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_authorized_for_current_course, :only => [:show]

	def show
	end

	 private
  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  
   def require_authorized_for_current_course
    if current_lesson.user != current_user
      render :text => "You must Enroll in this course to view it.", :status => :unauthorized
    end
  
end
