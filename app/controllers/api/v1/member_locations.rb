class API::V1::MemberLocations < Grape::API
  include API::V1::Defaults
  resource :member_locations do

    desc "update location"
    params do
      requires :code, type: String, desc: "team map code"
      requires :member_location, type: Hash, desc: "member attributes" do
        requires :location, type: String, desc: "member location"
        requires :name, type: String, desc: "member name"
      end
    end
    post '/' do
      team_map = TeamMap.find_by(code: permitted_params[:code])
      member_location = team_map.member_locations.create!(permitted_params[:member_location])
      member_location
    end

    desc "update location"
    params do
      requires :member_name, type: String, desc: "member id"
      requires :code, type: String, desc: "member id"
      requires :member_location, type: Hash, desc: "member attributes" do
        requires :location, type: String, desc: "member location"
      end
    end
    put ":code/:member_name" do
      team_map = TeamMap.find_by(code: permitted_params[:code])

      member_location = team_map.member_locations.find_by(name: permitted_params[:member_name])
      member_location.update! location: permitted_params[:member_location][:location]
      member_location
    end
  end
end
