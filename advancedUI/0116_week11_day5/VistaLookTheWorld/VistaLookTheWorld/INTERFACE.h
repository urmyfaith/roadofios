//
//  INTERFACE.h
//  VistaLookTheWorld
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//




//资讯页面

//#define INFORMATION_URL @"http://ktx.cms.palmtrends.com/api_v2.php?action=home_list&sa=&uid=10067566&mobile=iphone5&offset=0&count=15&&e=b7849d41b00bbacc9a62544402abed9e&uid=10067566&pid=10053&mobile=iphone5&platform=i"

#define INFORMATION_URL @"http://127.0.0.1/~zx/vistaLookTheWorld/information.json"

#define INFORMATION_DETAIL_URL @"http://ktx.cms.palmtrends.com/api_v2.php?action=article&uid=10067567&id=%@&mobile=iphone5&e=40dab97d773e7860febfc897c04824e2&fontsize=m"


//杂志页面
#define MAGAZINE_URL @"http://ktx.cms.palmtrends.com/api_v2.php?action=get_mags_list&sa=&uid=10067567&mobile=iphone5&offset=0&count=15&&e=40dab97d773e7860febfc897c04824e2&uid=10067567&pid=10053&mobile=iphone5&platform=i"

#define MAGAZINE_DETAIL_URL @"http://ktx.cms.palmtrends.com/api_v2.php?action=get_mags_detail&sa=&uid=10067567&mobile=iphone5&offset=0&count=1000&magid=%@&e=40dab97d773e7860febfc897c04824e2&uid=10067567&pid=10053&mobile=iphone5&platform=i"


//酷图页面
//offset 偏移量
//count记录的条数
#define PICTURE_URL @"http://ktx.cms.palmtrends.com/api_v2.php?action=piclist&sa=&uid=10067567&mobile=iphone5&offset=%i&count=%i&&e=40dab97d773e7860febfc897c04824e2&uid=10067567&pid=10053&mobile=iphone5&platform=i"

#define PICTURE_DETAIL_URL @"http://ktx.cms.palmtrends.com/api_v2.php?action=picture&sa=&uid=10067567&mobile=iphone5&of fset=0&count=15&gid=%@&moblie=iphone5&e=40dab97d773e7860febfc897c04824e2&uid=10067567&pid=10053&mobile=iphone5&platform=i"

