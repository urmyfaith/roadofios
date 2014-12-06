//
//  main.m
//  week4_day1_练习题_编程题
//
//  Created by zx on 11/24/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "windowsPhone.h"
#import "moviePoster.h"
#import <stdio.h>
#import "calculator.h"
#import "weibo.h"
#import "ipad.h"
#import "TransportEcard.h"
#import "ATM.h"
#import "Ecoupon.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //第一题
#if 0
        windowsPhone *wp = [windowsPhone new];
        wp->_color = black;
        wp->_size = 3.5;
        wp->_memory = 512;
        wp->_CPU = 1.5;
        [wp playMusic:"God is a girl"];
        [wp playMovie:"Interstellar"];
        [wp sendMail];
        NSLog(@"%s",[wp takePicture]);
#endif

        //第二题
#if 0
        moviePoster *mp = [moviePoster new];
        mp->_title = "将爱情进行到底";
        mp->_actors[0] = "李亚鹏";
        mp->_actors[1] = "徐静蕾";
        mp->_commpany[0] = "北京小马奔腾影业有限公司";
        mp->_commpany[1] = "北京伟德福思文化传播有限公司";
        mp->_date = "2011年2月12日";
        mp->fp = fopen("moviePoster.jpg", "+r");
        printf("电影名:\t %s\n",mp->_title);
        printf("主演:\t %s %s\n",mp->_actors[0],mp->_actors[1]);
        printf("赞助:\t %s %s \n",mp->_commpany[0],mp->_commpany[1]);
        printf("上映日期:\t %s\n",mp->_date);
#endif
        
        /**
         *  习题3：
         设计一个简单的计算器，可求一个数的平方值，两个数的差值，
         两个数的和，以及两个数相除
         */
#if 0
        calculator *cal = [calculator new];
        NSLog(@"%i",[cal add:3 :4]);
        NSLog(@"%i",[cal squre:4]);
        NSLog(@"%i",[cal sub:3 :4]);
        NSLog(@"%i",[cal divide:3 :4]);
        
#endif
        /**
         *  习题4: 根据图片信息，设计一条微博类，要求能够表述一条完整的微博信息就可以
         */
#if 0
        weibo *wb = [weibo new];;
        wb->_name = "老罗";
        wb->_content = "关于“锤子手机”，你可能听说过很多，但你知道大部分讨论它的人，其实根本就没见过更没摸过它吗？《听听真正的 Smartisan T1 用户在说什么之四》，以下内容全来自于天猫店与京东上收到的评价。锤子科技天猫旗舰店";
        wb->_date = "9月3日 16:08";
        wb->_readCount = 34;
        wb->_commentCount = 161;
        wb->_likeCount = 16;
        printf("%s\n",wb->_name);
        printf("%s\n",wb->_content);
        printf("%s\n",wb->_date);
        printf("阅读(%ld万)\n",wb->_readCount);
        printf("全部转播和评论(%ld)\n",wb->_commentCount);
        printf("赞(%ld)\n",wb->_likeCount);
        [wb doComment];
        [wb doLike];
        [wb doCollect];
        [wb doRepost];
        
#endif
        
        /**
         *  习题6：
         设计一台ipad，根据图设计属性，ipad功能有，
         下载软件，安装软件，玩游戏，播放音乐，搜索信息，发送Email，编辑word文档功能。
         */
#if 0
        ipad *myipad = [ipad new];
        myipad->_name = "ipad mini 2";
        myipad->_size = 5;
        myipad->_color = white;
        NSLog(@"%s",myipad->_name);
        NSLog(@"%d inch",myipad->_size);
        NSLog(@"%d",myipad->_color);
        
        [myipad installSoftware:"weChat"];
        [myipad uninstallSoftware:"weChat"];
        [myipad playGame];
        [myipad playMusic];
        [myipad searchMessage:"hello"];
        [myipad sendEmail];
        [myipad editWord];
        
#endif
        
        /**
         *  习题7：
         公交一卡通充值机器系统，有两种功能选择，
         第一种投入硬币或者纸币，选择购票，
         第二种一卡通充值，充值面额是20，50，100元。
         */
#if 0
        TransportEcard *tEcard = [TransportEcard new];
        
        
        //充值50元;
        [tEcard setBalance:MoneyWith50];
        
        //买一次票;
        [tEcard buyTicket];
        [tEcard buyTicket];
        
        //显示余额
        NSLog(@"%i",[tEcard balance]);//输出 46元.
#endif
        
        /*
         习题9：
         设计ATM取款机，能够存钱，取钱，判断假币。
         */
#if 0
        ATM *atm1 = [ATM new];
        
        //存钱
        [atm1 setBlance:100];
        
        //取钱
        int getMoney = [atm1 balance:100];
        
        //判断假币
        BOOL isFack =  [ATM isFackMoney:100];
        
        
#endif
        
        /*
         习题11：
         电子优惠卷，是个大商家比较流行的一种营销方式，既环保又能够吸引顾客c消费，
         */
#if 1
        Ecoupon *eco = [Ecoupon new];
        
        [eco setName:@"香辣鸡腿堡"];
        
        [eco setValue:20];
        
        [eco setWhenToUse:@"每日上午10:30之后"];
        [eco setExpiryDate:@"2013年12月4日~2014年12月30日"];
        
        NSLog(@"%@",eco);
        
#endif
    }
    return 0;
}
