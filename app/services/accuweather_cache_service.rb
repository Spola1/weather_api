class AccuweatherCacheService
  API_KEY = ENV.fetch("ACCUWEATHER_API_KEY").freeze
  private_constant :API_KEY
  BASE_URL = "https://dataservice.accuweather.com".freeze
  private_constant :BASE_URL
  LOCATION_KEY = "28800".freeze
  private_constant :LOCATION_KEY

  def self.call
    new.call
  end

  def call
    parsed_response.each do |weather|
      Forecast
        .find_or_initialize_by(epoch_time: Time.at(weather["EpochTime"]))
        .update(temperature: weather.dig("Temperature", "Metric", "Value"))
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
