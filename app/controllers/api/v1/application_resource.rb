module API
  module V1
    class ApplicationResource < Grape::API
      include API::V1::Defaults
    end
  end
end
