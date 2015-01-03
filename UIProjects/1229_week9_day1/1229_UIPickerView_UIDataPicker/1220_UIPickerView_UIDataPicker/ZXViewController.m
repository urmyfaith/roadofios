//
//  ZXViewController.m
//  1220_UIPickerView_UIDataPicker
//
//  Created by zx on 12/29/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXViewController.h"

@interface ZXViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic,copy) NSArray *citys;
@property (nonatomic,strong) NSArray    *names;
@property (nonatomic,strong) NSMutableArray    *totoalArray;
@end

@implementation ZXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.citys  =  @[@"北京",@"天津",@"上海",@"广州"];
    self.names = @[@"京",@"冀",@"沪",@"粤"];
    
    self.totoalArray = [NSMutableArray array];
    [self.totoalArray addObject:self.citys];
    [self.totoalArray addObject:self.names];
    
	UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.frame = CGRectMake(10, 20, 300, 150);

    pickerView.delegate = self;
    pickerView.dataSource = self;
    
    [self.view addSubview:pickerView];
    

    //当前选中的行.
    [pickerView selectRow:1 inComponent:1 animated:YES];
//    
//    NSInteger *row = [pickerView selectedRowInComponent:0];
//    NSLog(@"%s [LINE:%d] %i", __func__, __LINE__,row);

    
    UIDatePicker *datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(10, 200, 300, 150)];
    [self.view addSubview:datePicker];
    
    datePicker.datePickerMode = UIDatePickerModeTime;//设置显示模式:需要显示哪些?
    datePicker.date = [NSDate dateWithTimeIntervalSinceNow:60*30];//设置显示的时间
    [datePicker  setDate:    datePicker.date animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma  mark UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return [self.totoalArray count];
}

//有几行?
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.totoalArray[component] count];
}

//每行的title?
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.totoalArray[component][row];
}

//自定义每行显示的view
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *label = [[UILabel alloc]  init];
    label.frame = CGRectMake(0,0,300,40);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = self.totoalArray[component][row];
    return label;
}

//选中的执行的方法;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"%s [LINE:%d] row=%@", __func__, __LINE__,self.totoalArray[component][row]);
}


@end
