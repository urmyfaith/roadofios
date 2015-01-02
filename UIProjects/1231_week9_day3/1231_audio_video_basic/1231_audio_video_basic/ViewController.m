//
//  ViewController.m
//  1231_audio_video_basic
//
//  Created by zx on 12/31/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "ZXCustomButton.h"

@interface ViewController ()

@property (nonatomic,strong) AVAudioPlayer    *player;
@property (nonatomic,strong)   MPMoviePlayerViewController *moviePlayer;
@property (nonatomic,strong)   UISlider *slider;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self testAudio];
    [self loadUI];
    [self testVideo];
}

/*
 导入系统库
 导入头文件
 找到视频文件
 创建视频播放器对象
 播放
 */
-(void)testVideo{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"dzs" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    self.moviePlayer = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
    self.moviePlayer.view.frame  = self.view.bounds;
    [self.view addSubview:self.moviePlayer.view];
}
-(void)loadUI{
    ZXCustomButton *myButton = [ZXCustomButton buttonWithFrame:CGRectMake(100,40, 100, 40) title:@"play" andBlock:^(ZXCustomButton *button){
        if (self.player.playing == YES) {
            [self.player pause];
            [button setTitle:@"play" forState:UIControlStateNormal];
        }
        else{
            [self.player play];
            [button setTitle:@"stop" forState:UIControlStateNormal];
        }
    }];
    [self.view addSubview:myButton];
    
    
    self.slider = [[UISlider alloc]initWithFrame:CGRectMake(100, 100, 150, 40)];
    self.slider.minimumValue = 0.0;
    self.slider.maximumValue = [self.player duration];//音频的持续时间//这值需要在音频之后.
    [self.slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.slider];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self     selector:@selector(timeLoop:)   userInfo:nil repeats:YES];
}

-(void)timeLoop:(NSTimer *)timer{
    self.slider.value = self.player.currentTime;
}

// 拖动滑块到时候执行的方法.
-(void)changeValue:(UISlider *)slider{
    self.player.currentTime =  slider.value;
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

/*
 导入系统库
 导入头文件
 创建音频播放器对象
 导入音频文件
 播放
 */
-(void)testAudio{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"bye" ofType:@"mp3"];
    
    //取文件的时候需要使用fileURLWithPath,而不是之前的urlwithString之类的.
    NSURL *url = [NSURL fileURLWithPath:path];
    
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    [self.player prepareToPlay];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
