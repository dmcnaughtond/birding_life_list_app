class SightingRecordsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,    only: :destroy

  def create
    @sighting_record = current_user.sighting_records.build(sighting_record_params)
    if @sighting_record.save
      flash[:success] = "Sighting record created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @sighting_record.destroy
    flash[:success] = "Sighting record deleted"
    redirect_to request.referrer || root_url
  end

  private

    def sighting_record_params
      params.require(:sighting_record).permit(:order, :family, :genus_species, :common_name, :location, :date, :notes, :picture)
    end

    def correct_user
      @sighting_record = current_user.sighting_records.find_by(id: params[:id])
      redirect_to root_url if @sighting_record.nil?
    end
end