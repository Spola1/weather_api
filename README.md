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
