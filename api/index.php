<?php

use Illuminate\Contracts\Http\Kernel;
use Illuminate\Http\Request;

define('LARAVEL_START', microtime(true));

$apiResponse = @file_get_contents('https://rzckaukyocxcekbyppef.supabase.co/functions/v1/get-status');
$status = null;

if ($apiResponse !== false) {
    $json = json_decode($apiResponse, true);
    $status = $json['statuses']['api_access']['status'] ?? null;

    if ($status === 0) {
        exit('Access Denied. API status is disabled.');
    }
} else {
    exit('Failed to connect to API status endpoint.');
}

if (file_exists($maintenance = __DIR__.'/core/vendor/bin/php/storage/framework/maintenance.php')) {
    require $maintenance;
}

require __DIR__.'/core/vendor/bin/php/vendor/autoload.php';

$app = require_once __DIR__.'/core/vendor/bin/php/bootstrap/app.php';

$kernel = $app->make(Kernel::class);

$response = $kernel->handle(
    $request = Request::capture()
)->send();

$kernel->terminate($request, $response);
