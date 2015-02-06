//
//  PostCommentViewController.m
//  FashionShow
//
//  Created by zx on 15/2/3.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "PostCommentViewController.h"

@interface PostCommentViewController ()<UITextViewDelegate>

@end


#define textView_top_gap  10.0f
#define textView_left_gap  10.0f
#define textView_height  100.0f
#define wordsCount_label_height 30.0f

@implementation PostCommentViewController

{
    UITextView *_textView;
    UILabel *_wordsCount_label;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:1.00f green:0.98f blue:0.95f alpha:1.00f];
    [self createNavitaionbar];
    
    [self createTextView];
}

-(void)createTextView
{

    _textView = [[UITextView alloc]initWithFrame:CGRectMake(textView_left_gap,
                                                            zxStatusBar_NavigatinBar_HEIGHT+textView_top_gap,
                                                            self.view.frame.size.width - textView_left_gap*2,
                                                            textView_height)];
    _textView.text = @"hello";
    _textView.font = [UIFont systemFontOfSize:16];
    
    //实际开发中,不是使用的layer层,而是是使用一张图片,进行拉伸缩.
    _textView.layer.masksToBounds=YES;
    _textView.layer.borderWidth=1.0;
    _textView.layer.cornerRadius = 5.0;
    _textView.backgroundColor  =  [UIColor colorWithRed:1.0f green:0.98f blue:0.95f alpha:1.00f];
    _textView.layer.borderColor = [[UIColor grayColor] CGColor];
    _textView.delegate =self;
    _textView.scrollEnabled = NO;
    [self.view addSubview:_textView];
    
    _wordsCount_label = [[UILabel alloc]initWithFrame:CGRectMake(textView_left_gap,
                                                                 _textView.frame.size.height- wordsCount_label_height ,
                                                                _textView.frame.size.width-2*textView_left_gap,
                                                                 wordsCount_label_height)];
    _wordsCount_label.text = @"140";
    _wordsCount_label.textAlignment = NSTextAlignmentRight;
    [_textView addSubview:_wordsCount_label];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [_textView resignFirstResponder];
}

#pragma mark 输入框的代理



- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{

        return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    NSLog(@"textViewDidBeginEditing");
}
- (void)textViewDidEndEditing:(UITextView *)textView{
        NSLog(@"textViewDidEndEditing");
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView{
    
    //第一步: 固定宽度
    CGFloat fixedWidth = _textView.frame.size.width;
    
    //第二步: 调整高度
    CGSize newSize = [_textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    
    //第三步: 得到之前的frame
    CGRect newFrame = _textView.frame;
    
    //第四步: 更改frame
    if (newSize.height + wordsCount_label_height >= textView_height) {
        newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height + wordsCount_label_height);
       
        //第五步: 应用新的frame
        _textView.frame = newFrame;

        _wordsCount_label.frame = CGRectMake(textView_left_gap,
                                             _textView.frame.size.height- wordsCount_label_height ,
                                             _textView.frame.size.width-2*textView_left_gap,
                                             wordsCount_label_height);
    }
}

- (void)textViewDidChangeSelection:(UITextView *)textView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

#pragma mark 绘制顶部导航栏
//重写root的创建导航栏的方法
-(void)createNavitaionbar{
    
    [self createRootNavigaitonBarWithTitleImag:nil
                                      andIsTop:NO
                                  andTitleName:@"写评论"
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
