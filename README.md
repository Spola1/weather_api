# Тестовое задание: API для статистики по погоде
Как источник данных можно использовать 
- https://developer.accuweather.com/apis
- Город можно использовать любой (можно захардкодить).
- API открыт для всех, авторизация не нужна.
- Ожидаемая нагрузка на любой эндпоинт: 5 RPS

Необходимые эндпоинты:

- /weather/current - Текущая температура
- /weather/historical - Почасовая температура за последние 24 часа (https://developer.accuweather.com/accuweather-current-conditions-api/apis/get/currentconditions/v1/{locationKey}/historical/24)
- /weather/historical/max - Максимальная темперетура за 24 часа
- /weather/historical/min - Минимальная темперетура за 24 часа
- /weather/historical/avg - Средняя темперетура за 24 часа
- /weather/by_time - Найти температуру ближайшую к переданному timestamp (например 1621823790 должен отдать температуру за 2021-05-24 08:00. Из имеющихся данных, если такого времени нет вернуть 404)
- /health - Статус бекенда (Можно всегда отвечать OK)

Должны быть интеграционные тесты на эндпоинты и юнит тесты на общие классы/модули.

Рекомендуется хранить данные о температуре локально для снижения нагрузки на сторонний API.

# AccuweatherApi

### Usage:

- Clone repo:
```
git clone git@github.com:Spola1/weather_api.git
```
- Go to the app folder:
```
cd ./weather_api
```
- Create .env file
```
sudo nano .env
```
- Add Accuweather Api Key
```
ACCUWEATHER_API_KEY=VALUE
```
- Save .env file
```
Ctrl+O Ctrl+X
```
- Run docker-dompose build
```
sudo docker-compose build
```
- Create DB
```
sudo docker-compose run web bundle exec rails db:create db:migrate
```
- Build and spin up the server
```
sudo docker-compose up --build
```
- Open the second terminal tab 
- Run rails console
```
sudo docker-compose exec web rails console
```
- Call Accuweather Cache Service
```
AccuweatherCacheService.call
```
### Now you can send requests from browser

#### Requests:
- http://0.0.0.0:3000/health
- http://0.0.0.0:3000/weather/historical/max
- http://0.0.0.0:3000/weather/historical/min
- http://0.0.0.0:3000/weather/historical/avg
- http://0.0.0.0:3000/weather/current
- http://0.0.0.0:3000/weather/historical
- http://0.0.0.0:3000/weather/by_time?timestamp=value
