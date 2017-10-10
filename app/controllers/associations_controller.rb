class AssociationsController < ApplicationController

  http_basic_authenticate_with name: ENV['SYSADMIN_USERNAME'], password: ENV['SYSADMIN_PASSWORD'], except: [:increase_ranking, :decrease_ranking]

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

  def increase_ranking
    @item = Item.find(params[:item_id])
    @association = @item.associations.find(params[:association_id])
    if @association.updated_at.to_i < Time.now.to_i - 60
      @association.update_attribute('ranking', @association.ranking + 1)
    end
  end

  def decrease_ranking
    @item = Item.find(params[:item_id])
    @association = @item.associations.find(params[:association_id])
    if @association.updated_at.to_i < Time.now.to_i - 60
      @association.update_attribute('ranking', @association.ranking - 1)
    end
  end

  private
  def association_params
    params.require(:association).permit(:name, :ranking)
  end
end
