class TeamMapsController < ApplicationController
  def new
    @team_map = TeamMap.new
  end

  def create
    if params[:go_to_map]
      @team_map = TeamMap.find_by(code: params[:team_map][:code])
      return redirect_to new_member_location_path(code: @team_map.code) if @team_map
      redirect_to "/#download", flash: { danger: I18n.t("errors.invalid_team_map_code") }
    else
      team_map = CreateTeamMapService.perform
      redirect_to new_member_location_path(code: team_map.code)
    end
  end
end