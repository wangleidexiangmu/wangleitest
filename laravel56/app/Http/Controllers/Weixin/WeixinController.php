<?php

namespace App\Http\Controllers\Weixin;
use   Illuminate\Support\Facades\Redis;
use Illuminate\Http\Request;
use  App\model\weixin\weixin;
use App\Http\Controllers\Controller;

class WeixinController extends Controller
{
    public function valid(){
        echo $_GET['echostr'];
    }
    public function wxEvent()
    {
        //接收微信服务器推送
        $content = file_get_contents("php://input");
        $time = date('Y-m-d H:i:s');
        $str = $time ."\n". $content . "\n";
        file_put_contents("logs/wx_event.log",$str,FILE_APPEND);
        $data = simplexml_load_string($content,'SimpleXMLElement');
        $wx_id = $data['ToUserName'];             // 公众号ID
        $openid = $data['FromUserName'];          //用户OpenID
        $event = $data['Event'];          //事件类型
       // var_dump($data['Event']);exit;
        if($event=='subscribe'){        //扫码关注事件
            //根据openid判断用户是否已存在
            $local_user = weixin::where(['openid'=>$openid])->first();
            if($local_user){
                //用户之前关注过
                echo '<xml><ToUserName><![CDATA['.$openid.']]></ToUserName><FromUserName><![CDATA['.$wx_id.']]></FromUserName><CreateTime>'.time().'</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA['. '欢迎回来 '. $local_user['nickname'] .']]></Content></xml>';
            }else{          //用户首次关注
                //获取用户信息
                $u = $this->getUserInfo($openid);
                //用户信息入库
                $u_info = [
                    'openid'    => $u['openid'],
                    'nickname'  => $u['nickname'],
                    'sex'  => $u['sex'],
                    'headimgurl'  => $u['headimgurl'],
                ];
                $id = weixin::insertGetId($u_info);
                echo '<xml><ToUserName><![CDATA['.$openid.']]></ToUserName><FromUserName><![CDATA['.$wx_id.']]></FromUserName><CreateTime>'.time().'</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA['. '欢迎关注 '. $u['nickname'] .']]></Content></xml>';
            }
        }
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
    public function card(){
        $res='https://api.weixin.qq.com/cgi-bin/menu/create?access_token='.$this->getAccessToken().'';
        $arrInfo ='{
            "button":[
     {
         "type":"click",
          "name":"今日歌曲",
          "key":"V1001_TODAY_MUSIC"
      },
      {
          "name":"菜单",
           "sub_button":[
           {
               "type":"view",
               "name":"搜索",
               "url":"http://www.soso.com/"
            },
            {
                "type":"miniprogram",
                 "name":"wxa",
                 "url":"http://mp.weixin.qq.com",
                 "appid":"wx286b93c14bbf93aa",
                 "pagepath":"pages/lunar/index"
             },
            {
                "type":"click",
               "name":"赞一下我们",
               "key":"V1001_GOOD"
            }]
       }]
 }';
        $data=file_get_contents($res,$arrInfo);

        var_dump($data);
    }
}