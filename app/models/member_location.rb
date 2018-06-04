class MemberLocation < ApplicationRecord
  belongs_to :team_map

  validates :name, uniqueness: { scope: :team_map, message: I18n.t("errors.taken_name") }
  validates :location, presence: true
end
