//
//  ZXConfigViewController.m
//  1213_passValue01
//
//  Created by zx on 12/13/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ZXConfigViewController.h"
#import "ZXSignalModel.h"

@interface ZXConfigViewController ()<UITextFieldDelegate>


@end

@implementation ZXConfigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.frame = CGRectMake(100,50,160,40);
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.backgroundColor = [UIColor colorWithRed:200/255. green:200/255. blue:200/255. alpha:0.5];
    [self.view addSubview:nameLabel];
    
    //use signal modele.
    ZXSignalModel *signal = [ZXSignalModel  sharedSignalModel];
    nameLabel.text = signal.name;
    
    
    
    UITextField *changeSizeTextField = [[UITextField alloc]init];
    changeSizeTextField.tag = 102;
    changeSizeTextField.frame = CGRectMake(90, 150, 140, 40);
    changeSizeTextField.placeholder = @"size";
    changeSizeTextField.text = @"16";
    changeSizeTextField.borderStyle = UITextBorderStyleRoundedRect;
    changeSizeTextField.backgroundColor = [UIColor colorWithRed:200/255. green:200/255. blue:200/255. alpha:0.5 ];
    changeSizeTextField.delegate = self;
    [self.view addSubview:changeSizeTextField];
    
    UIButton *backToMainButton = [[UIButton alloc]init];
    backToMainButton.frame = CGRectMake(90, 220, 140, 40);
    backToMainButton.backgroundColor = [UIColor grayColor];
    [backToMainButton setTitle:@"back" forState:UIControlStateNormal];
    [backToMainButton.layer setMasksToBounds:YES];
    [backToMainButton.layer setCornerRadius:10];
    [backToMainButton addTarget:self action:@selector(backToMain:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backToMainButton];
    
}


-(void)backToMain:(UIButton *)button{
    UITextField *field = (UITextField *)[self.view viewWithTag:102];
    
    // 容错处理.
    if ([self.delegate respondsToSelector:@selector(changeFontSizeWithField:)]) {
//        [self.delegate  changeFontSizeWithField:field];
        [self.delegate performSelector:@selector(changeFontSizeWithField:) withObject:field];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];//所有的代码需要在此行之前(即为退栈,入栈之前)
    //否则对象要么已经没有了,要么对象的修改无效.

//    [ self presentViewController:mainView animated:YES completion:nil];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return  YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
