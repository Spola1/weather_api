namespace :accuweather do
  desc "Import data from Accuweather"
  task import: :environment do
    AccuweatherCacheService.call
  end
end
