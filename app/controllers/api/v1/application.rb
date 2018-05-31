module API
  module V1
    class Application < Grape::API
      include API::V1::Defaults
    end
  end
end
