module API
  module V1
    class TeamMaps < Application
      resource :team_maps do

        desc "Return a list member of a team_maps."
        params do
          requires :code, type: String, desc: "team_maps code"
        end
        get ":code", root: :team_maps do
          team_map = TeamMap.find_by(code: permitted_params[:code])
          team_map.member_locations
        end
      end
    end
  end
end
