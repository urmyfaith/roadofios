
## 资讯页面,json格式

http://ktx.cms.palmtrends.com/api_v2.php?action=home_list&sa=&uid=10067566&mobile=iphone5&offset=0&count=15&&e=b7849d41b00bbacc9a62544402abed9e&uid=10067566&pid=10053&mobile=iphone5&platform=i


~~~objectivec
{
  "code": 1,
  "msg": "OK",
  "list": [
    {
      "id": "4908",
      "title": "英雄难过蚂蚁关",
      "desc": "继续深入亚马逊丛林，我们的下一站，是“子弹蚁部落”。我要去那儿，迎接这次亚马逊探险的终极挑战。在赴巴西之前做功课的时候，得知丛林深处藏着一个很奇怪的部落，部落里的每个男性，必须要经过被子弹蚁尾刺针蛰的成人礼，方才能留在部落里，否则就会被驱逐出村子。而子弹蚁到底有多厉害？蚁如其名，仿佛中枪。子弹蚁是世界上最大的蚂蚁，也是蜇人最痛的蚂蚁。酋长是个胖子，得知我们的来意之后，一脸的蔑视，他觉得我不敢挑战。",
      "icon": "http://img2.ifenghui.com/ktx_t/detail/270/170/0/2014/11/6/1415252768953.jpg",
      "author": "联合版权",
      "pub_time": "2014-11-06"Mi
    },
	...
~~~

##  咨询详情页面,html

id为文章的参数,从资讯json里得到

http://ktx.cms.palmtrends.com/api_v2.php?action=article&uid=10067567&id=4093&mobile=iphone5&e=40dab97d773e7860febfc897c04824e2&fontsize=m

## 杂志,json格式

http://ktx.cms.palmtrends.com/api_v2.php?action=get_mags_list&sa=&uid=10067567&mobile=iphone5&offset=0&count=15&&e=40dab97d773e7860febfc897c04824e2&uid=10067567&pid=10053&mobile=iphone5&platform=i


~~~objectivec
{
  "code": 1,
  "msg": "OK",
  "list": [
    {
      "id": "137",
      "title": "军训怎么了",
      "desc": "【军训怎么了】很多人都参加过军训，但这个系统到底是怎么运转的？56万教官怎样训1700万学生？20年前，北大复旦的学生（其中包括冯唐、张泉灵、范美忠、方三文等人）参加过长达一年的军训，又到底是怎么回事？国外又是怎么军训的？",
      "cover": "http://img2.ifenghui.com/ktx_t//article/src/2014/10/27/1414375424655.jpg",
      "pub_time": "2014-10-27",
      "year": "2014",
      "vol_year": "24",
      "update_time": "2014-10-27"
    },
    {
      "id": "136",
      "title": "毒家明星",
      "desc": "【毒家明星】房祖名第一次吸食大麻时23岁，他原以为这不会上瘾，结果吸了八年。有一次，他把卷好的大麻递到来自己家玩的柯震东面前……每部电影都有一个不同的开头，但结果往往相似，不是天堂就是地狱，吸毒的故事属于后者，即便外人永远不知，即便是闪闪明星……",
      "cover": "http://img2.ifenghui.com/ktx_t//article/src/2014/10/25/1414219757166.jpg",
      "pub_time": "2014-10-25",
      "year": "2014",
      "vol_year": "23",
      "update_time": "2014-10-25"
    },
~~~

## 杂志详情,json

mag	cid从杂志id得到

http://ktx.cms.palmtrends.com/api_v2.php?action=get_mags_detail&sa=&uid=10067567&mobile=iphone5&offset=0&count=1000&magid=113&e=40dab97d773e7860febfc897c04824e2&uid=10067567&pid=10053& mobile=iphone5&platform=i

~~~objectivec
{
  "code": 1,
  "msg": "OK",
  "cats": [
    {
      "cat_name": "时政",
      "list": [
        {
          "id": "4030",
          "title": "瑞士公投，准备给全民发工资"
        }
      ]
    },
  {
      "cat_name": "封面故事",
      "list": [
        {
          "id": "4032",
          "title": "私房钱“生钱”大法"
        }
      ]
    },
~~~



## 酷图,json

count调节图数量

http://ktx.cms.palmtrends.com/api_v2.php?action=piclist&sa=&uid=10067567&mobile=iphone5&offset=0&count=9&&e=40dab97d773e7860febfc897c04824e2&uid=10067567&pid=10053&mobile=iphone5&platform=i

~~~objectivec
{
  "code": 1,
  "msg": "OK",
  "list": [
    {
      "gid": "4905",
      "title": "穿着校服上学去",
      "icon": "http://img2.ifenghui.com/ktx_t//wallpaper/380/280/1/2014/10/27/1414376927657.jpg",
      "timestamp": "1414404006"
    },
    {
      "gid": "4904",
      "title": "“熊抱”李克强",
      "icon": "http://img2.ifenghui.com/ktx_t//wallpaper/380/280/1/2014/10/27/1414376541767.jpg",
      "timestamp": "1414404006"
    },
    ...
~~~

## 酷图详情,json

**gid从酷图中得到gid**

http://ktx.cms.palmtrends.com/api_v2.php?action=picture&sa=&uid=10067567&mobile=iphone5&offset=0&count=15&gid=4086&moblie=iphone5&e=40dab97d773e7860febfc897c04824e2&uid=10067567&pid=10053&mobile=iphone5&platform=i

~~~objectivec
{
  "code": 1,
  "msg": "OK",
  "list": [
    {
      "id": "",
      "title": "正能量-5",
      "icon": "http://img2.ifenghui.com/ktx_t//wallpaper/src/2014/1/26/1390730867270.jpg",
      "small_icon": "http://img2.ifenghui.com/ktx_t//wallpaper/380/280/1/2014/1/26/1390730867270.jpg",
      "des": "刚出生3个月的小黑熊开始室外活动，母熊叼着小熊“散步”。2013年5月28日，河南洛阳",
      "author": "",
      "adddate": "2014-01-27"
    }
  ]
}
~~~

