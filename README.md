# PHP 5.6 + Apache PFM

### PHP extensions
mysqli
OPCache
gettext
GD
### Apache modules
mod-rewrite
## Usage
Run a PHP application
```
docker run -d --name php56 -v your-app-path:/var/www/html ondrejnov/php56
```
or with bind apache port to host
```
docker run -d --name php56 -p 80:80 -v your-app-path:/var/www/html ondrejnov/php56
```