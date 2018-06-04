class CreateTeamMapService
  def initialize(params)
    @params = params
  end

  def self.perform(params={})
    new(params).perform
  end

  def perform
    @params[:code] ||= generate_code
    return TeamMap.create!(@params)
  end

  private

  def generate_code
    code = ''
    loop do
      code = charset.sample(6).join
      next unless code =~ /\d/ # skip if it doesn't include any digit number
      break unless TeamMap.find_by(code: code)
    end
    code
  end

  def charset
    # avoiding ambiguous caracters like i, l and 1
    %w{ 2 3 4 5 6 7 8 9 A B C D E F G H J K M N P Q R S T U V W X Y Z}
  end
end