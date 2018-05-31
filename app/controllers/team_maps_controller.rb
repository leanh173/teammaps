class TeamMapsController < ApplicationController
  def new
    @team_map = TeamMap.new
  end

  def create
    if params[:go_to_map]
      @team_map = TeamMap.find_by(code: params[:code])
      redirect_to team_map_path(team_map) if team_map
      @team_map.errors.add(:code, I18n.t("errors.invalid_team_map_code"))
      render :new
    else
      team_map = CreateTeamMapService.perform
      redirect_to team_map_path(code: team_map.code)
    end
  end

  def show
    @team_map = TeamMap.find_by(code: params[:code])
    redirect_to root_path unless @team_map
  end
end