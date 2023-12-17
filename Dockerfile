FROM base-laravel:latest

WORKDIR /var/www/html/

# Building process
COPY laravel-app .
COPY configs/laravel/.env .
RUN composer install --no-dev
RUN chown -R nobody:nobody /var/www/html/storage
RUN php artisan key:generate
RUN php artisan optimize:clear
RUN php artisan storage:link
