<img src="https://firebasestorage.googleapis.com/v0/b/easy-money-76612.appspot.com/o/EasyMoney-logo.png?alt=media&token=99769e3d-eadf-4b97-b39c-d36e940d5177" alt="logo" width="180"/>

## EasyMoney Laravel

EasyMoney Laravel is developed to use in Application Programing Interface (API) and Web Admin.

Here is a list of the packages installed:

- [Laravel Passport](https://laravel.com/docs/8.x/passport)
- [Laravel Fractal](https://github.com/spatie/laravel-fractal)
- [Laravel Permission](https://github.com/spatie/laravel-permission)

## Installation

First you need to clone project by

```bash
git clone https://github.com/CSG6Project1/easy_money_laravel.git
```

After project cloned successfully, please run

```bash
cd easy_money_laravel
composer install
```

When all dependencies installed run `cp .env.example .env`

When you .env copy completed please open code editor or ide and modify the .env file to suit your needs

```
APP_NAME=Laravel
APP_ENV=local
APP_KEY=
APP_DEBUG=true
APP_URL=http://localhost

LOG_CHANNEL=stack
LOG_LEVEL=debug

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=

BROADCAST_DRIVER=log
CACHE_DRIVER=file
QUEUE_CONNECTION=sync
SESSION_DRIVER=file
SESSION_LIFETIME=120

MEMCACHED_HOST=127.0.0.1

REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=smtp
MAIL_HOST=mailhog
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS=null
MAIL_FROM_NAME="${APP_NAME}"

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
PUSHER_APP_CLUSTER=mt1

MIX_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
MIX_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"
```

When you have the .env with your database connection set up you can run your migrations

```bash
php artisan migrate
```
Then run `php artisan passport:install`

Run `php artisan db:seed` and you should have a new user with the roles and permissions set up

When you complete all command you can run `php artisan serve` to run this project.
