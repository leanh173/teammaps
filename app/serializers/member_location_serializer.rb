class MemberLocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :lat, :lng

  def lat
    object.location.split(",").first
  end

  def lng
    object.location.split(",").last
  end
end