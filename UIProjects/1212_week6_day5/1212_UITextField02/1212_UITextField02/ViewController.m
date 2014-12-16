//
//  ViewController.m
//  1212_UITextField02
//
//  Created by zx on 12/12/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

typedef enum{
    TagWithInputReturnButton = 100,
} MyTag;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];

    
    //=====UserName=====
    UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(100,100,160,40)];
    
    tf.center = CGPointMake(160,120);
    tf.backgroundColor = [UIColor whiteColor];
    
    //**style**
    /*
     typedef NS_ENUM(NSInteger, UITextBorderStyle) {
     UITextBorderStyleNone,
     UITextBorderStyleLine,
     UITextBorderStyleBezel,
     UITextBorderStyleRoundedRect
     };
     */
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.delegate = self;
    [self.view addSubview:tf];
    
    
    //===Password=====
    UITextField *password = [[UITextField alloc]initWithFrame:CGRectMake(100,160,160,40)];
    password.center = CGPointMake(160,180);
    password.backgroundColor = [UIColor whiteColor];
    password.borderStyle = UITextBorderStyleRoundedRect;
    //password.tag = 100;
    password.tag = TagWithInputReturnButton;
    password.delegate = self;
    [self.view addSubview:password];
    
    //defaultTextAttributes
    tf.placeholder = @"input username";
    password.placeholder = @"input password";
    
    //clear button
    /**
     typedef NS_ENUM(NSInteger, UITextFieldViewMode) {
     UITextFieldViewModeNever,//总不显示
     UITextFieldViewModeWhileEditing,//当编辑的时候
     UITextFieldViewModeUnlessEditing,//不在编辑的时候
     UITextFieldViewModeAlways//总显示
     };
     */
    tf.clearButtonMode = UITextFieldViewModeAlways;
    password.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    //Secure Input
    password.secureTextEntry = YES;
    
    //setBackgroud -->add picture/image-->边框不能是圆角矩形
    tf.borderStyle = UITextBorderStyleNone;
    tf.background = [UIImage imageNamed:@"back"];
    
    //tf.enabled = NO;
    
    
    //限制return的使用:当输入框没有内容的时候.
    tf.enablesReturnKeyAutomatically = YES;
    
    
    //限制只能输入数字
    /**
     *  typedef NS_ENUM(NSInteger, UIKeyboardType) {
     UIKeyboardTypeDefault,                // Default type for the current input method.
     UIKeyboardTypeASCIICapable,           // Displays a keyboard which can enter ASCII characters, non-ASCII keyboards remain active
     UIKeyboardTypeNumbersAndPunctuation,  // Numbers and assorted punctuation.
     UIKeyboardTypeURL,                    // A type optimized for URL entry (shows . / .com prominently).
     UIKeyboardTypeNumberPad,              // A number pad (0-9). Suitable for PIN entry.
     UIKeyboardTypePhonePad,               // A phone pad (1-9, *, 0, #, with letters under the numbers).
     UIKeyboardTypeNamePhonePad,           // A type optimized for entering a person's name or phone number.
     UIKeyboardTypeEmailAddress,           // A type optimized for multiple email address entry (shows space @ . prominently).
     UIKeyboardTypeDecimalPad NS_ENUM_AVAILABLE_IOS(4_1),   // A number pad with a decimal point.
     UIKeyboardTypeTwitter NS_ENUM_AVAILABLE_IOS(5_0),      // A type optimized for twitter text entry (easy access to @ #)
     UIKeyboardTypeWebSearch NS_ENUM_AVAILABLE_IOS(7_0),    // A default keyboard type with URL-oriented addition (shows space . prominently).
     
     UIKeyboardTypeAlphabet = UIKeyboardTypeASCIICapable, // Deprecated
     
     };
     */
    password.keyboardType = UIKeyboardTypeNumberPad;
    
    //数字键盘添加return按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(215,0,105,40);
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton addTarget:self
                   action:@selector(keyBoardBack:)
         forControlEvents:UIControlEventTouchUpInside];
    
    //父视图,view作为属性视图-->输入框的上面--->通过这个视图给键盘添加额外的功能
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, 320, 40);
    view.backgroundColor = [UIColor whiteColor];
    
    [view addSubview:backButton];
    password.inputAccessoryView = view;
    
    
    //===InputView的使用=====>自定义键盘
    /**
    重新设计输入框的inputView属性:通过设计这个inputView来自定义键盘
     */
    UIView *viewInput = [[UIView alloc]initWithFrame:CGRectMake(0,0,320,200)];
    viewInput.backgroundColor = [UIColor redColor];
   // password.inputView = viewInput;
    
    /*==========输入框的左视图leftView===========
     * 作为UITextField的左视图属性
     * 1.左边可以添加标签
     * 2.左边可以添加图片
     ==========输入框的右视图rightView===========
     * --->左视图和右视图同时存在的时候,需要创建2个独立的视图对象.
     */
#if 0
    UILabel  *leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0,60,40)];
    leftLabel.text = @"用户名";
    tf.leftView = leftLabel;
    tf.leftViewMode = UITextFieldViewModeAlways;
#endif
    
#if 1
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"head8_100x100"]];
    imageView.frame = CGRectMake(0, 0, 40, 40);
    tf.leftView = imageView;
    tf.leftViewMode = UITextFieldViewModeAlways;
#endif
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"head8_100x100"]];
    imageView2.frame = CGRectMake(0, 0, 40, 40);
    tf.rightView =imageView2;
    tf.rightViewMode = UITextFieldViewModeAlways;

    /*==========去掉开头字母的大写提示=====*/
    tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    /*==========去掉纠错提醒===========*/
    tf.autocorrectionType = UITextAutocorrectionTypeNo;
    
    /*==========调整文字大小,进行自适应显示===========*/
    tf.adjustsFontSizeToFitWidth = YES;
    tf.minimumFontSize = 5;
    
    
    
    
    
    UITextField *thirdField = [[UITextField alloc]initWithFrame:CGRectMake(100,20,160,80)];
    thirdField.center = CGPointMake(160,60);
    thirdField.backgroundColor = [UIColor whiteColor];
    thirdField.borderStyle = UITextBorderStyleRoundedRect;
    thirdField.delegate = self;
    [self.view addSubview:thirdField];
    
    /*==========调整文字的位置===========*/
    //内容从底部输入
    thirdField.contentHorizontalAlignment = UIControlContentVerticalAlignmentBottom;
    //内容右侧对齐
    thirdField.textAlignment = NSTextAlignmentRight;
    //内容文本大小.
    thirdField.font = [UIFont systemFontOfSize:20];
    
}
-(void)keyBoardBack:(UIButton *)button{
    //UITextField *pass = (UITextField *) [self.view viewWithTag:100];
    UITextField *pass = (UITextField *) [self.view viewWithTag:TagWithInputReturnButton];
    [pass resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];

    return YES;
}

@end
