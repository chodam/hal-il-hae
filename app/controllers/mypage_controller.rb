class MypageController < ApplicationController
  
  def check
    respond_to do |format|
      format.json { render json: User.where(nickname: params[:nickname]).present? }
    end
  end
  
  def home
    @users = current_user
  end

  
end
