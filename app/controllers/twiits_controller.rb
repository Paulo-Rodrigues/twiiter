class TwiitsController < ApplicationController
  before_action :authenticate_user!

  def index
    @twiits = Twiit.all
  end
end
