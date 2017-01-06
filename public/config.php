<?php
// HTTP
define('HTTP_SERVER', 'http://'.$_SERVER["HTTP_HOST"].'/');

// HTTPS
define('HTTPS_SERVER', 'http://'.$_SERVER["HTTP_HOST"].'/');

// DIR
define('DIR_APPLICATION', '/var/www/html/public/catalog/');
define('DIR_SYSTEM', '/var/www/html/public/system/');
define('DIR_DATABASE', '/var/www/html/public/system/database/');
define('DIR_LANGUAGE', '/var/www/html/public/catalog/language/');
define('DIR_TEMPLATE', '/var/www/html/public/catalog/view/theme/');
define('DIR_CONFIG', '/var/www/html/public/system/config/');
define('DIR_IMAGE', '/var/www/html/public/image/');
define('DIR_CACHE', '/var/www/html/public/system/cache/');
define('DIR_DOWNLOAD', '/var/www/html/public/download/');
define('DIR_UPLOAD', '/var/www/html/public/system/upload/');
define('DIR_MODIFICATION', '/var/www/html/public/system/modification/');
define('DIR_LOGS', '/var/www/html/public/system/logs/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', '172.17.0.1');
define('DB_USERNAME', 'ouroaf');
define('DB_PASSWORD', 'nqwhuf7w36d');
define('DB_DATABASE', 'ouroaf');
define('DB_PREFIX', 'oc_');

$_SESSION['use_category_password'] = 1;
$_SESSION['use_product_password'] = 1;