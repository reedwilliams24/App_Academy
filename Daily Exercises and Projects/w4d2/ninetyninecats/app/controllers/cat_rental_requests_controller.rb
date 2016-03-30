class CatRentalRequestController < ApplicationController
  def create
    @cat_rental_request = CatRentalRequest.create(cat_request_params)
  end

  protected
  def cat_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
