class StarsController < ApplicationController

before_action :set_star, only: [:show, :edit, :update, :destroy]

  def show
     
  end


  private
  def set_star
    @star = Star.find(params[:id])
  end

end