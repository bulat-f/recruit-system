class CleanersController < ApplicationController
  before_action :authenticate!

  def index
  end

  def show
  end

  def new
    @cleaner = Cleaner.new
  end

  def create
    @cleaner = Cleaner.new cleaner_params
    if @cleaner.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def cleaner_params
    params.require(:cleaner).permit(:name, :phone, :home_location_id, :work_location_id)
  end
end
