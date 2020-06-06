class BachelorettesContestantsController < ApplicationController
  def index
    @bachelorette = Bachelorette.find(params[:id])
  end
end
