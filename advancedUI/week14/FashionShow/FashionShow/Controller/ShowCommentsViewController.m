//
//  ShowCommentsViewController.m
//  FashionShow
//
//  Created by zx on 15/2/3.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "ShowCommentsViewController.h"
#import "CommentModel.h"
#import "CommentIteModel.h"
#import "PostCommentViewController.h"

#define writeCommentImageView_gap 5.0f

@interface ShowCommentsViewController ()

@end

@implementation ShowCommentsViewController
{
    NSArray *_tableViewDataSource_array;
    NSString *_tips;
    UIImageView *_writeCommentImageView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createNavitaionbar];
    [self previewLoadUI];
    [self downloadData];
}

-(void)previewLoadUI{
    self.view.backgroundColor = [UIColor colorWithRed:1.00f green:0.98f blue:0.95f alpha:1.00f];
    
#pragma mark 绘制底部评论框
    UIImage *writeCommentImage = [UIImage imageNamed:@"我要评论_1"];
    
    _writeCommentImageView= [[UIImageView alloc]initWithFrame:
                                          CGRectMake(0,
                                                     self.view.frame.size.height - writeCommentImage.size.height -writeCommentImageView_gap,
                                                     self.view.frame.size.width,
                                                     writeCommentImage.size.height)];
    _writeCommentImageView.image = writeCommentImage;
    [self.view addSubview:_writeCommentImageView];

    _writeCommentImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(writeCommentClicked)];
    [_writeCommentImageView addGestureRecognizer:tap];
    
    
    
#pragma mark 绘制表视图

}

#pragma mark 点击评论框,跳转页面
-(void)writeCommentClicked{
    PostCommentViewController *pvc =[[PostCommentViewController alloc]init];
    pvc.article_id = _comment_article_id;
    [self.navigationController pushViewController:pvc animated:YES];
}

#pragma mark 下载数据
-(void)downloadData{
    
    /*
     NSString *postData_string = @"action=article&id=%@&uid=11111111&e=a2ae6a1b2c1a6aa2faa07bf2bd57ab37&platform=a&pid=10129&mobile=HUAWEI+P6-C00&fontsize=m";
     postData_string = [NSString stringWithFormat:postData_string,_article_id];
     
     //注意,这里地址中间有一个问号,将地址和参数分割开来
     _urlIdentifier = [NSString stringWithFormat:@"%@?%@",zxAPI_FULLPATH,postData_string];

     */

    NSString *postData_string = @"action=commentlist&id=%@&uid=11111111&e=a2ae6a1b2c1a6aa2faa07bf2bd57ab37&platform=a&pid=10129&mobile=HUAWEI+P6-C00&fontsize=m";
    postData_string = [NSString stringWithFormat:postData_string,_comment_article_id];
    _urlIdentifier= [NSString stringWithFormat:@"%@%@",zxAPI_FULLPATH,postData_string];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(mainPage_downloadFinish)
                                                name:_urlIdentifier
                                              object:nil];
    [[DownloadManager sharedDownloadManager] addDownloadWithDownloadURL:zxAPI_FULLPATH andDownloadResqustMethod:@"POST"andPostDataString:postData_string];
}

-(void)mainPage_downloadFinish{
    _tableViewDataSource_array = [JSON2Model JSONData2ModelWithURLIdentifier:_urlIdentifier andDataType:zxJSON_DATATYPE_COMMENT];
    CommentModel *cm =  (CommentModel *) _tableViewDataSource_array[0];
    if( [cm.list count] > 0)
    {
        _tableViewDataSource_array = cm.list;
    }else{
        _tips = cm.msg;//没有评论数据
    }
//    [_tabelView reloadData];
}


#pragma mark 绘制顶部导航栏
//重写root的创建导航栏的方法
-(void)createNavitaionbar{
    
    [self createRootNavigaitonBarWithTitleImag:nil
                                      andIsTop:NO
                                  andTitleName:@"大家在评论"
                            andBackgroundImage:nil
                          andLeftBtnImagesName:@"内文返回_1"
                         andRightBtnImagesName:nil
                                      andClass:self
                                        andSEL:@selector(navigationBarClicked:)];
}

-(void)navigationBarClicked:(UIButton *)button{
    if (button.tag == zxNavigaionBarButtonLeftTag) {
#if 1
        [self.navigationController popViewControllerAnimated:YES];
#else
        [self dismissViewControllerAnimated:YES completion:nil];
#endif
    }
}


@end
