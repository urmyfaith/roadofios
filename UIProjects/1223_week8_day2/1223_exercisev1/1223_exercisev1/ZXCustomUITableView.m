//
//  ZXCustomUITableView.m
//  1223_exercisev1
//
//  Created by zx on 12/23/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXCustomUITableView.h"

@implementation ZXCustomUITableView
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame  style:style];
    if (self) {
        self.delegate       = self;
        self.dataSource     = self;
    }
    return self;
}
-(void)setTableViewFrame:(CGRect)tableViewFrame{
    self.frame              = tableViewFrame;
}
#pragma mark delegat

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40*4;
}

#pragma mark dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.name_Marray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier     = @"cellIndentifier";
    UITableViewCell *cell               = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:cellIdentifier];
       
        
        UILabel * label4name = [[UILabel alloc]initWithFrame:CGRectMake(40,0,80,40)];
        label4name.text = @"name:";
        [cell addSubview:label4name];
        self.name_Label  = [[UILabel alloc]initWithFrame:CGRectMake(120,0,100,40)];
        [self.name_Label setTag:100];
        [cell addSubview:self.name_Label];
        
        
        UILabel * label4sex = [[UILabel alloc]initWithFrame:CGRectMake(40,40,80,40)];
        label4sex.text = @"sex:";
        [cell addSubview:label4sex];
        self.sex_Label  = [[UILabel alloc]initWithFrame:CGRectMake(120,40,100,40)];
        [self.sex_Label setTag:200];
        [cell addSubview:self.sex_Label];

        UILabel * label4telephone = [[UILabel alloc]initWithFrame:CGRectMake(40,40*2,80,40)];
        label4telephone.text = @"tele:";
        [cell addSubview:label4telephone];
        self.telephone_Label  = [[UILabel alloc]initWithFrame:CGRectMake(120,40*2,120,40)];
        [self.telephone_Label setTag:300];
        [cell addSubview:self.telephone_Label];
        
        UILabel * label4ID = [[UILabel alloc]initWithFrame:CGRectMake(40,40*3,40,40)];
        label4ID.text = @"ID:";
        [cell addSubview:label4ID];
        self.ID_Label  = [[UILabel alloc]initWithFrame:CGRectMake(80,40*3,240,40)];
        [self.ID_Label setTag:400];
        [cell addSubview:self.ID_Label];
        
        
        self.modifyButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.modifyButton.tag = 500;
        self.modifyButton.frame = CGRectMake(255, 20, 55, 120);
        [self.modifyButton setTitle:@"modify" forState:UIControlStateNormal];
        self.modifyButton.backgroundColor = [UIColor whiteColor];
        [self.modifyButton.layer setMasksToBounds:YES];
        [self.modifyButton.layer setCornerRadius:10];
        [self.modifyButton.layer setBorderWidth:2];
        [self.modifyButton.layer setBorderColor:[UIColor grayColor].CGColor];
        [cell addSubview:self.modifyButton];
    }
    self.name_Label  = (UILabel *)[cell viewWithTag:100];
    self.name_Label.text = [self.name_Marray objectAtIndex:indexPath.row];

    self.sex_Label =(UILabel *)[cell viewWithTag:200];
    self.sex_Label.text = [self.sex_Marray objectAtIndex:indexPath.row];

    self.telephone_Label =(UILabel *)[cell viewWithTag:300];
    self.telephone_Label.text = [self.telephone_Marray objectAtIndex:indexPath.row];
    
    self.ID_Label =(UILabel *)[cell viewWithTag:400];
    self.ID_Label.text = [self.ID_Marray objectAtIndex:indexPath.row];
    
    self.modifyButton =(UIButton *)[cell viewWithTag:500];
    self.modifyButton.accessibilityIdentifier = [NSString stringWithFormat:@"%i",500+indexPath.row];
    [self.modifyButton addTarget:self action:@selector(modifyButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
  //  NSLog(@"%s [LINE:%d] row=%i = %@", __func__, __LINE__,indexPath.row,[self.name_Marray objectAtIndex:indexPath.row]);
    return cell;
}

-(void)modifyButtonClicked:(UIButton *)button{
    NSInteger rowNumber = [button.accessibilityIdentifier integerValue] -500;
    NSLog(@"%s [LINE:%d] rowNumber=%i", __func__, __LINE__,rowNumber);
    //传值,创建页面.
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    //self.name_Marray
    [center postNotificationName:@"modifyRow" object:self userInfo:@{
                                                                     @"name_key":self.name_Marray[rowNumber],
                                                                     @"sex_key":self.sex_Marray[rowNumber],
                                                                     @"tele_key":self.telephone_Marray[rowNumber],
                                                                     @"id_key":self.ID_Marray[rowNumber],
                                                                     @"string4RowNumber_key":button.accessibilityIdentifier
                                                                     }];
}

#pragma mark 删除/增加单元格
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
     return YES;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //删除数据源中对应的数据==>通知你去删除
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center postNotificationName:@"deleteRow" object:self userInfo:@{
                                                                         @"Key_indexPath":indexPath
                                                                         }];
    }
    
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
}
@end
