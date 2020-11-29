class OffersController < ApplicationController
  before_action :authenticate_visitor!

  def index
    @offers = Offer.all
  end
end
