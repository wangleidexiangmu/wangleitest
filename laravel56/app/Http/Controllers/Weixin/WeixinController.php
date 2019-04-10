<?php

namespace App\Http\Controllers\Weixin;
use Illuminate\Support\Facades\Redis;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class WeixinController extends Controller
{
    public function valid(){
        echo $_GET['echostr'];
    }
    public function wxEvent(){
        $content=file_get_contents("php://input");
        $time=date('Y-m-d H:i:s');
        $str=$time.$content."\n";
        file_put_contents("logs/wx_event.log",$str,FILE_APPEND);
        echo "SUCCESS";
    }
    public function getAccessToken(){
        $rul="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.env('WX_APPID')'&secret='.env('WX_SECRET')'";
        $response=file_get_contents($rul);

        $arr=json_decode($response,true);
        var_dump($arr);exit;
        //缓存
        $key='wx_access_token';
        Redis::set($key,$arr['access_token']);
        Redis::expire($key,3600);
        return $arr['access_token'];
    }
}