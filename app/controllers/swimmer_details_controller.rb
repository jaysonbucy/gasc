class SwimmerDetailsController < ApplicationController
  def index
    @swimmers = current_user.swimmer_details
  end

  def show
    @swimmer = SwimmerDetail.find(params[:id])
    @presenter = SwimmerDetailPresenter.new(@swimmer)
  end
end
