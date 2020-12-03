class OffersController < ApplicationController
  before_action :authenticate_visitor!

  def index
    @offers = Offer.where(visitor_id: [nil, current_visitor.id])
  end

  def select
    @offer = Offer.find_by_id(params[:id])

    if @offer&.update(visitor_id: current_visitor.id)
      flash[:message] = 'Offer selected successfully.'
    else
      flash[:message] = 'Offer could not be selected.'
    end

    redirect_to offers_path
  end

  def delete
    @offer = Offer.find_by_id(params[:id])

    if @offer&.update(visitor_id: nil)
      flash[:message] = 'Offer successfully deleted.'
    else
      flash[:message] = 'Offer could not be deleted.'
    end

    redirect_to offers_path
  end
end
