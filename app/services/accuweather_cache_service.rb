class AccuweatherCacheService
  API_KEY = ENV.fetch("ACCUWEATHER_API_KEY").freeze
  private_constant :API_KEY
  BASE_URL = "https://dataservice.accuweather.com".freeze
  private_constant :BASE_URL
  LOCATION_KEY = "28800".freeze
  private_constant :LOCATION_KEY

  def call
    parsed_response.map do |weather|
      { temperature: weather.dig("Temperature", "Metric", "Value"), epoch_time: weather["EpochTime"] }
    end
  end

  private

  def api_url
    "#{BASE_URL}/currentconditions/v1/#{LOCATION_KEY}/historical/24"
  end

  def parsed_response
    @parsed_response ||= HTTParty.get(api_url, query: { apikey: API_KEY }).parsed_response
  end
end
