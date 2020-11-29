class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_visitor!

  def index; end
end
