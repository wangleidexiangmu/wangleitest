<?php

namespace App\Http\Controllers\Weixin;
use   Illuminate\Support\Facades\Redis;
use Illuminate\Http\Request;
use  App\model\weixin\weixin;
use  App\model\weixin\txt;
use App\Http\Controllers\Controller;
use GuzzleHttp\Client;
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
        $event = $data['Event'];//事件类型
        $type=$data['MsgType'];
        $txt=$data['Conten'];//文本信息
        $addtime=$data['CreateTime'];//时间
        $MediaId=$data['MediaId'];//
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
        if($type=='text'){
            file_put_contents("/logs/txt.log", $str, FILE_APPEND);
            $u=$this->getUserInfo($openid);
            $info=[
                'openid'=>$u['openid'],
                'text'=>$txt,
                'createtime'=>$addtime,
            ];
            $txtinfo=txt::insert($info);
          
        } else if($type=='image'){
            $access = $this->getAccessToken();
            $url = "https://api.weixin.qq.com/cgi-bin/media/get?access_token=$access&media_id=$MediaId";
            $time = time();
            $res_str = file_get_contents($url);
            file_put_contents("/logs/image/$time.jpg", $res_str, FILE_APPEND);
        }else if($type=='voice'){
            $access =  $this->getAccessToken();
            $vourl = "https://api.weixin.qq.com/cgi-bin/media/get?access_token=$access&media_id=$MediaId";
            $votime = time();
            $res_str = file_get_contents($vourl);
            file_put_contents("/logs/voice/$votime.mp3", $res_str, FILE_APPEND);
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
    //微信菜单
    public function card(){
        $res='https://api.weixin.qq.com/cgi-bin/menu/create?access_token='.$this->getAccessToken().'';
        $arrInfo =[
            "button"=>[
                [
                 "type"=>"click",
                  "name"=>"客服",
                  "key"=>"V1001_TODAY_MUSIC01"
                ],
                [
                    "type"=>"click",
                    "name"=>"其他",
                    "key"=>"V1001_TODAY_MUSIC02"
                ],
           ] ,
        ];


        $data=json_encode($arrInfo,JSON_UNESCAPED_UNICODE);//处理中文编码
      //发送请求
        $clinet= new Client();
        //发送json字符串
        $response=$clinet->request('POST',$res,[
            'body'=>$data
        ]);
        //处理相应
        $reslut=$response->getBody();
        //转数组
        $arr = json_decode($reslut,true);
        //判断错误信息
        if($arr['errcode']>0){

            echo "创建菜单失败";
        }else{
            echo "创建菜单成功";
        }

    }


}