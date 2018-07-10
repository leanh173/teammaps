class MemberLocationWithCodeSerializer < MemberLocationSerializer
  attributes :map_code

  def map_code
    object.team_map.code
  end
end