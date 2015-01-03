//
//  ZXUserConfigViewController.m
//  1217_UIActionSheet_UITextView_etc
//
//  Created by zx on 12/29/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXUserConfigViewController.h"
#import "ZXAllMethod.h"
#import "ZXHttpRequest.h"
#import "ZXUserInfoModel.h"
#import "ZXTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ZXPickerView.h"


@interface ZXUserConfigViewController ()<UITableViewDelegate,UITableViewDataSource,UIPickerViewDataSource,UIPickerViewDelegate,UITextViewDelegate>
@property (nonatomic,strong) ZXHttpRequest      *httpRequest;
@property (nonatomic,strong) ZXUserInfoModel    *model;
@property (nonatomic,strong) NSMutableArray    *userInfo_Marray;
@property (nonatomic,strong) UITableView      *tableView;
@property (nonatomic,strong) ZXPickerView       *pickerView ;


@end

@implementation ZXUserConfigViewController


- (void)viewDidLoad {
    [super viewDidLoad];

}
-(NSMutableArray *)userInfo_Marray{
    if (_userInfo_Marray == nil) {
        _userInfo_Marray = [NSMutableArray array];
    }
    return _userInfo_Marray;
}
-(void)loadTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 40, 300, 460) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.scrollEnabled =NO;
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.userInfo_Marray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row!=0) {
        
        ZXTableViewCell *cell = [ZXTableViewCell cellWithTableView:tableView];
        ZXUserInfoModel *model = self.userInfo_Marray[indexPath.row];
        cell.userInfoModel = model;
        
        cell.textView4keyvalue.tag = indexPath.row;
        cell.textView4keyvalue.delegate = self;
        
        return cell;
    }
    else{
        
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
        
        UILabel *keyLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,
                                                                     5,
                                                                     40,
                                                                     40)];
        keyLabel.font = [UIFont systemFontOfSize:12];
        [cell addSubview:keyLabel];
        keyLabel.text = [self.userInfo_Marray[0] keyname];
        
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(240, 5, 30, 30);
        [cell addSubview:imageView];
        NSURL *url  = [NSURL URLWithString:[self.userInfo_Marray[0] keyvalue]];
        [imageView setImageWithURL:url];
        return cell;
    }

}

# pragma mark textView

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    NSInteger row = textView.tag;
    NSLog(@"%s [LINE:%d] %i", __func__, __LINE__,row);
    if (row == 2 ) {
        self.pickerView = [[ZXPickerView alloc] initWithTarget:self andAction:@selector(updateTextView:)];
        self.pickerView.frame = CGRectMake(0, 0, 320, 72);
        [textView setInputView:self.pickerView];
        
        UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithTitle:@"done"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(clickedDone:)];
        UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIToolbar *toolBar = [[UIToolbar alloc]init];
        toolBar.frame = CGRectMake(0,0,320,44);
        toolBar.items = @[space,done];
        [textView setInputAccessoryView:toolBar];
    return YES;
    }
    return NO;
    
}

-(void)clickedDone:(UIBarButtonItem *)finish{
    UITextView *tv = (UITextView *)[self.view viewWithTag:2];
    [tv resignFirstResponder];
}

-(void)updateTextView:(ZXPickerView *)pickerView{
    
    //NSLog(@"%s [LINE:%d] pickerView = %@", __func__, __LINE__,pickerView);
    UITextView *tv =(UITextView *) [self.view viewWithTag:2];
    tv.text = pickerView.sex_Array[[pickerView selectedRowInComponent:0]];
}

#if 0
- (void)textViewDidBeginEditing:(UITextView *)textView{
    NSInteger row = textView.tag;
    NSLog(@"%s [LINE:%d] %i", __func__, __LINE__,row);
    if (row == 2 ) {
        self.pickerView = [[ZXPickerView alloc] initWithTarget:self andAction:@selector(updateTextView:)];
        self.pickerView.frame = CGRectMake(0, 0, 320, 72);
        [textView setInputView:self.pickerView];
        textView.inputAccessoryView = nil;
    }
}
#endif



#if 0
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
//   [ tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
    if (indexPath.row == 2) {
        self.pickerView = [[ZXPickerView alloc]init];
        self.pickerView.frame = CGRectMake(10, 20, 300, 150);
        [self.view addSubview:self.pickerView ];

    }
    if (indexPath.row ==4) {
        UIDatePicker *datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(10, 200, 300, 150)];
        [self.view addSubview:datePicker];
        
        datePicker.datePickerMode = UIDatePickerModeTime;//设置显示模式:需要显示哪些?
        datePicker.date = [NSDate dateWithTimeIntervalSinceNow:60*30];//设置显示的时间
        [datePicker  setDate:    datePicker.date animated:YES];
    }
}
#endif

-(void)downlaodData{
    NSString *path     =@"http://localhost/~zx/UISettingResources/userInfo.json";
    self.httpRequest    = [[ZXHttpRequest alloc]initWithPath:path
                                                      target:self andAction:@selector(downLoadDataFinished:)];
    
}

-(void)downLoadDataFinished:(ZXHttpRequest *)httpRequest{

#if 0
    NSString *string = [[NSString alloc]initWithData:httpRequest.downloadData
                                            encoding:NSUTF8StringEncoding];
    NSLog(@"%s [LINE:%d]string=%@", __func__, __LINE__,string);
#endif
    
    NSArray *array = [NSJSONSerialization JSONObjectWithData:httpRequest.downloadData
                                                     options:NSJSONReadingMutableContainers
                                                       error:nil];
//  NSLog(@"%s [LINE:%d] %@", __func__, __LINE__,array);
    [self.userInfo_Marray  removeAllObjects];
    for (NSDictionary *dic in array) {
         self.model = [[ZXUserInfoModel alloc]init];
         [self.model setValue:dic[@"keyname"] forKey:@"keyname"];
         [self.model setValue:dic[@"keyvalue"] forKey:@"keyvalue"];
         [self.userInfo_Marray addObject:self.model];
    }
    NSLog(@"%s [LINE:%d],userInfo_Marray=%@", __func__, __LINE__,self.userInfo_Marray);
/*
 NSDictionary *dic =  [NSJSONSerialization JSONObjectWithData:httpRequest.downloadData
 options:NSJSONReadingMutableContainers
 error:nil];
 self.model = [[ZXUserInfoModel alloc]init];
 for(NSString *key in dic) {
 id value = [dic objectForKey:key];
 #if 0
 //        NSLog(@"%s [LINE:%d] %@---class:%@", __func__, __LINE__,value,[value class]);
 if ([value isKindOfClass:[NSString class]]) {
 [self.model setValue:value forKey:key];
 }
 if ([value isKindOfClass:[NSNumber class]]) {
 [self.model setValue:value forKey:key];
 }
 #endif
 [self.model setValue:value forKey:key];//根据键值对取出来的是对象(int--->NSNumber)
 }
 NSLog(@"%s [LINE:%d] model=%@", __func__, __LINE__,self.model);
 */
    [self.tableView reloadData];
}
-(void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger isLogedIn = [defaults integerForKey:@"isLogedIn"];
    NSLog(@"%s [LINE:%d] isLogedIn=%i", __func__, __LINE__,isLogedIn);
    if ( 1 == isLogedIn) {
        [self createUserConfigView];
        
    }else{
        UIButton *loginButton  = [UIButton buttonWithFrame:CGRectMake(100,100,120,40)
                                                 withTitle:@"登录"
                                                  withType:UIButtonTypeSystem
                                                withTarget:self
                                                withMethod:@selector(createLoginAlertView)];
        loginButton.tag = 300;
        [self.view addSubview:loginButton];
        [self createLoginAlertView];
    }
}

-(void)createUserConfigView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    self.title = @"个人资料";
    [self downlaodData];
    [self loadTableView];

}
-(void)createLoginAlertView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"输入帐号密码:" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    alertView.alertViewStyle  = UIAlertViewStyleLoginAndPasswordInput ;
    [alertView show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        UITextField *account = [alertView textFieldAtIndex:0];
        UITextField *password = [alertView textFieldAtIndex:1];
        if ([account.text isEqual:@"zx"] &&[password.text isEqual:@"zx"] ) {
            NSLog(@"%s [LINE:%d]", __func__, __LINE__);
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setInteger:1 forKey:@"isLogedIn"];
            [self.view viewWithTag:300].hidden = YES;
            [self createUserConfigView];
        }
    }
}

@end
