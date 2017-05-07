class AssignmentsController < ApplicationController
  def show
    @assignment = Assignment.find params[:id]
  end

  def new
    @assignment = resource.new
  end

  def create
    @assignment = resource.new assignment_params
    if @assignment.save
      redirect_to @assignment
    else
      render :new
    end
  end

  private

  def assignment_params
    req =
      if params[:type] == 'Replacement'
        params.require(:replacement)
      else
        params.require(:permanent)
      end
    req.permit(:zip_code, :radius, :message)
  end

  def resource
    if params[:type]
      params[:type].constantize
    else
      Assignment
    end
  end
end
