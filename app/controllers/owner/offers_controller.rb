class Owner::OffersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_offer, only: %i[edit update destroy]

  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = current_user.offers.build(offer_params)

    if @offer.save
      flash[:message] = 'Offer successfully created.'
      redirect_to owner_offers_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @offer.update(offer_params)
      flash[:message] = 'Offer successfully updated.'
      redirect_to owner_offers_path
    else
      render :edit
    end
  end

  def destroy
    if @offer.destroy
      flash[:message] = 'Offer successfully deleted.'
      redirect_to owner_offers_path
    else
      redirect_to owner_offer_path(@offer)
    end
  end

  private

  # def authenticate_owner
  #   redirect_to root_path unless current_user.is_owner
  # end

  def set_offer
    @offer = Offer.find params[:id]
  end

  def offer_params
    params.require(:offer).permit(:starts, :ends, :days, :capacity, :parking_price, :discount)
  end
end
