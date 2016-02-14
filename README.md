# Sample Non-rails sidekiq app with Mongoid, Rspec, 

## Usage
*To start sidekiq*
```bash
sidekiq -r ./sidekiq.rb
#or
APP_ENV=development sidekiq -r ./sidekiq.rb
```

*To open up IRB session*
```bash
irb -r ./sidekiq.rb
#or
APP_ENV=development irb -r ./sidekiq.rb
```

*To start using Guard for TDD*
```bash
guard
```

## Docker

*Build image from Dockerfile*
```bash
docker build -t sidekiq-app .
```

*Docker-compose*
```bash
docker-compose up
```
