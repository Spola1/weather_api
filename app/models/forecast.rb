class Forecast < ApplicationRecord
  scope :sorted, -> { order(epoch_time: :desc) }
  scope :historical, -> { sorted.limit(24) }

  def self.by_time!(timestamp)
    raise ActiveRecord::RecordNotFound unless timestamp
    raise ActiveRecord::RecordNotFound unless timestamp.match?(/\A\d+\z/)

    prev_forecast =
      Forecast.where("epoch_time <= ?", Time.at(timestamp.to_i)).sorted.first

    next_forecasdt =
      Forecast.where("epoch_time >= ?", Time.at(timestamp.to_i)).order(:epoch_time).first

    closest_forecast =
      [prev_forecast , next_forecasdt]
        .compact
        .sort_by { |forecast| (forecast.epoch_time.to_i - timestamp.to_i).abs }
        .select { |forecast| (forecast.epoch_time.to_i - timestamp.to_i).abs <= 3.hours.to_i }
        .first

    raise ActiveRecord::RecordNotFound unless closest_forecast

    closest_forecast
  end

  def as_json(*)
    super(only: %i[temperature epoch_time])
  end
end
