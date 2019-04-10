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
       // var_dump($content);exit;
        $time=date('Y-m-d H:i:s');
        $str=$time.$content."\n";
        file_put_contents("logs/wx_event.log",$str,FILE_APPEND);
        echo "SUCCESS";
    }
    public function getAccessToken(){
        //判断是否有缓存
        $key='wx_access_token';
        $token=redis::get($key);
        if($token) {

        }else{
            $rul='https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.env('WX_APPID').'&secret='.env('WX_SECRET').'';
            //var_dump($rul);exit;
            $response=file_get_contents($rul);
            //var_dump($response);exit;
            $arr=json_decode($response,true);
            //  var_dump($arr);exit;
            //缓存

            Redis::set($key,$arr['access_token']);
            Redis::expire($key,3600);
            return $arr['access_token'];

        }
        return $token;

    }
    //测试
    public function test()
    {
        $access_token = $this->getAccessToken();
        echo 'token : '. $access_token;echo '</br>';
    }
    //获取微信用户信息
    public function getUserInfo($openid)
    {
        $url = 'https://api.weixin.qq.com/cgi-bin/user/info?access_token='.$this->getAccessToken().'&openid='.$openid.'&lang=zh_CN';
        $data = file_get_contents($url);
        $u = json_decode($data,true);
        return $u;
    }
}