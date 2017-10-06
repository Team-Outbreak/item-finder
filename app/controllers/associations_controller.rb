class AssociationsController < ApplicationController

  http_basic_authenticate_with name: ENV['SYSADMIN_USERNAME'], password: ENV['SYSADMIN_PASSWORD']

  def create
    @item = Item.find(params[:item_id])
    @association = @item.associations.create(association_params)
    redirect_to item_path(@item)
  end

  def destroy
    @item = Item.find(params[:item_id])
    @association = @item.associations.find(params[:id])
    @association.destroy
    redirect_to item_path(@item)
  end

  private
  def association_params
    params.require(:association).permit(:name, :ranking)
  end
end
