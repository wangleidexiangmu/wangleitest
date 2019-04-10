<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('/info',function(){
   phpinfo();
});
Route::get('index','index\IndexController@index');
Route::get('login','login\LoginController@login');
Route::get('register','login\RegisterController@register');
Route::get('regauth','login\RegauthController@regauth');
Route::get('reset','login\ResetController@reset');
Route::post('add','login\RegisterController@add');
Route::post('log','login\LoginController@log');
Route::get('show','index\IndexController@show');
Route::post("code",'login\RegisterController@code');
Route::any("loading",'index\IndexController@loading');
Route::any('show','index\IndexController@show');
Route::get('goods','index\GoodsController@goods');
Route::get('cate','index\GoodsController@cate');
Route::get('getCateInfo','index\GoodsController@getCateInfo');
Route::any("loadend",'index\GoodsController@loadend');
Route::get('meet','index\GoodsController@meet');
Route::post('catenav','index\GoodsController@catenav');
Route::any('shop','index\GoodsController@shop');
Route::any('cut','index\GoodsController@cut');
Route::any('checkUserLogin','index\GoodsController@checkUserLogin');
Route::any('cart','index\GoodsController@cart');
Route::any('crt','index\GoodsController@crt');
Route::any('dis','index\GoodsController@dis');
Route::any('data','index\GoodsController@data');
Route::any('delect','index\GoodsController@delect');
Route::any('set','index\GoodsController@set');
Route::any('detil','index\GoodsController@detil');
Route::any('det','index\GoodsController@det');
Route::any('order','index\GoodsController@order');
Route::any('ord','index\GoodsController@ord');
Route::any('addres','index\GoodsController@addres');
Route::any('sho','index\GoodsController@sho');
Route::any('edit','index\GoodsController@edit');
Route::any('editads','index\GoodsController@editads');
Route::any('shan','index\GoodsController@shan');
Route::any('xuan','index\GoodsController@xuan');
Route::any('user','index\IndexController@user');
//微信
Route::get('weixin/vaild1','Weixin\WeixinController@valid');
//Route::psot('weixin/vaild1','Weixin\WeixinController@valid');
Route::post('weixin/vaild1','Weixin\WeixinController@wxEvent');
//token
Route::any('weixin/token','Weixin\WeixinController@getAccessToken');

