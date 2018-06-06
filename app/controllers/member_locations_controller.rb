class MemberLocationsController < ApplicationController
  def new
    team_map = TeamMap.find_by(code: params[:code])
    redirect_to root_path unless team_map
    @member_location = team_map.member_locations.new
  end

  def create
    team_map = TeamMap.find_by(code: params[:code])
    member_location = team_map.member_locations.new(member_location_params)
    return redirect_to member_location_path(code: params[:code], member_name: member_location.name) if member_location.save
    redirect_to(new_member_location_path(code: team_map.code), flash: { danger: I18n.t("errors.invalid_name") })
  end

  def show
    @team_map = TeamMap.find_by(code: params[:code])
    redirect_to root_path unless @team_map

    @member_location = @team_map.member_locations.find_by(name: params[:member_name])
    redirect_to team_maps_path(code: params[:code]) unless @member_location
  end

  def member_location_params
    params.require(:member_location).permit(:name, :location)
  end
end