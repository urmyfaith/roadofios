//
//  ZXModifyOrAddViewController.m
//  1223_exercisev1
//
//  Created by zx on 12/23/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXModifyOrAddViewController.h"

@interface ZXModifyOrAddViewController ()

@end

@implementation ZXModifyOrAddViewController

-(instancetype)init{
    self = [super init];
    if (self) {
        UILabel *label4name = [[UILabel alloc]initWithFrame:CGRectMake(40, 22+40+50, 80, 40)];
        label4name.text = @"name:";
        [self.view addSubview:label4name];
        self.nameTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(100, 22+40+50, 200, 40)];
        self.nameTextFiled.backgroundColor = [UIColor whiteColor];
        [self.nameTextFiled.layer setMasksToBounds:YES];
        [self.nameTextFiled.layer setCornerRadius:5];
        [self.nameTextFiled.layer setBorderWidth:2];
        [self.nameTextFiled.layer setBorderColor:[UIColor grayColor].CGColor];
        [self.view addSubview:self.nameTextFiled];
        
        UILabel *label4sex = [[UILabel alloc]initWithFrame:CGRectMake(40, 22+40+50+50*1, 80, 40)];
        label4sex.text = @"sex:";
        [self.view addSubview:label4sex];
        self.sexTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(100, 22+40+50+50*1, 200, 40)];
        self.sexTextFiled.backgroundColor = [UIColor whiteColor];
        [self.sexTextFiled.layer setMasksToBounds:YES];
        [self.sexTextFiled.layer setCornerRadius:5];
        [self.sexTextFiled.layer setBorderWidth:2];
        [self.sexTextFiled.layer setBorderColor:[UIColor grayColor].CGColor];
        [self.view addSubview:self.sexTextFiled];
        
        UILabel *label4tele = [[UILabel alloc]initWithFrame:CGRectMake(40, 22+40+50+50*2, 80, 40)];
        label4tele.text = @"tele:";
        [self.view addSubview:label4tele];
        self.telephoneTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(100, 22+40+50+50*2, 200, 40)];
        self.telephoneTextFiled.backgroundColor = [UIColor whiteColor];
        [self.telephoneTextFiled.layer setMasksToBounds:YES];
        [self.telephoneTextFiled.layer setCornerRadius:5];
        [self.telephoneTextFiled.layer setBorderWidth:2];
        [self.telephoneTextFiled.layer setBorderColor:[UIColor grayColor].CGColor];
        [self.view addSubview:self.telephoneTextFiled];
        
        UILabel *label4id = [[UILabel alloc]initWithFrame:CGRectMake(40, 22+40+50+50*3, 80, 40)];
        label4id.text = @"ID:";
        [self.view addSubview:label4id];
        self.IDTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(100, 22+40+50+50*3, 200, 40)];
        self.IDTextFiled.backgroundColor = [UIColor whiteColor];
        [self.IDTextFiled.layer setMasksToBounds:YES];
        [self.IDTextFiled.layer setCornerRadius:5];
        [self.IDTextFiled.layer setBorderWidth:2];
        [self.IDTextFiled.layer setBorderColor:[UIColor grayColor].CGColor];
        [self.view addSubview:self.IDTextFiled];
    }
    return self;
}
- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(220, 22+40+50+50*3+90, 80, 40);
    button.backgroundColor = [UIColor whiteColor];
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:5];
    [button.layer setBorderWidth:2];
    [button setTitle:@"Done" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(updateRow) forControlEvents:UIControlEventTouchUpInside];
}
-(void)updateRow{
    NSMutableArray *oneRowData_Marray = [NSMutableArray array];
    [oneRowData_Marray addObject:self.nameTextFiled.text];
    [oneRowData_Marray addObject:self.sexTextFiled.text];
    [oneRowData_Marray addObject:self.telephoneTextFiled.text];
    [oneRowData_Marray addObject:self.IDTextFiled.text];
    [oneRowData_Marray addObject:self.sting4RowNumber];
    [self.navigationController popViewControllerAnimated:YES];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center postNotificationName:@"updateRow" object:self userInfo:@{
                                                                    @"array4Row_key":oneRowData_Marray
                                                                    }];
    
}



@end
