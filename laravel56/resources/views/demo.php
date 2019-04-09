private function getCateInfo($cate_id){
$arr=DB::table('shop_category')->select("cate_id")->where('pid',$cate_id)->get();
if(count($arr)>0){
foreach ($arr as $k=>$v){
$cate_id=$v->cate_id;
$arrNews=$this->getCateInfo($cate_id);
}
}
foreach ($arr as $v){
$cate_id=$v->cate_id;
arr_push(self::$arrCate,$cate_id);
}

}
}