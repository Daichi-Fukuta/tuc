class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :configure_permitted_parameters, if: :devise_controller? 
  before_action :set_serch

  def set_serch
    @q = Item.ransack(params[:q])
    @items = @q.result.with_attached_image.find_newest_items(params[:page])
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :avatar, :first_name, :last_name, :first_name_phonetic, :last_name_phonetic, :birthday, :gender_id, :postal_code, :address, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nick_name, :avatar, :first_name, :last_name, :first_name_phonetic, :last_name_phonetic, :birthday, :gender_id, :postal_code, :address, :description, :phone])
  end
end