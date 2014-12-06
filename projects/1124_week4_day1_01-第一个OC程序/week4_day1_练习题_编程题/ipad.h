//
//  ipad.h
//  week4_day1_01-第一个OC程序
//
//  Created by zx on 11/24/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    black_1,
    white_2
}COLOR1;

@interface ipad : NSObject
{
    @public
    char *_name;
    int _size;
    COLOR1 _color;
}
-(void)installSoftware:(char *) softwareName;
-(void)uninstallSoftware:(char *) softwareName;
-(void)playGame;
-(void)playMusic;
-(void)searchMessage:(char *)stringToSearch;
-(void)sendEmail;
-(void)editWord;
@end
