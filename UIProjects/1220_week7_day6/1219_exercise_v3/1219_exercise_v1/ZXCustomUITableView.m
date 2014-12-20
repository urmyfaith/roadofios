//
//  ZXCustomUITableView.m
//  1219_exercise_v1
//
//  Created by zx on 12/19/14.
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

#pragma mark dataSourceDelegeatMethods:MUST
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_textLabel_Marray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier     = @"cellIndentifier";
    UITableViewCell *cell               = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
#if 0
    // 此方法会有重复,需要设置tag值
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:cellIdentifier];
        self.cityName_Label  = [[UILabel alloc]initWithFrame:CGRectMake(90,5,100,40)];
        self.cityName_Label.text = [_textLabel_Marray objectAtIndex:indexPath.row];
        
        UIImage *cityImage = [UIImage imageNamed:[_images_MArray objectAtIndex:indexPath.row]];
        self.cityImageView   = [[UIImageView alloc]initWithImage:cityImage];
        
        self.detailTextView  = [[UITextView alloc]initWithFrame:CGRectMake(90,40,320-10-90,44)];
        self.detailTextView.text = [[_subtitle_MArray objectAtIndex:indexPath.row] substringToIndex:30];
        [self.detailTextView setEditable:NO];
        [self.detailTextView setSelectable:NO];
        
        [cell addSubview:self.cityName_Label];
        [cell addSubview:self.detailTextView];
        [cell addSubview:self.cityImageView];
        
        self.cityImageView.frame = CGRectMake(15, 10, 70, 70);
    }
#endif
    
#if 1
    //设置tag值
    
    UIImage *cityImage = [UIImage imageNamed:[_images_MArray objectAtIndex:indexPath.row]];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:cellIdentifier];
        self.cityName_Label  = [[UILabel alloc]initWithFrame:CGRectMake(90,5,100,40)];
        [self.cityName_Label setTag:100];
        
        self.cityImageView   = [[UIImageView alloc]initWithImage:cityImage];
        [self.cityImageView setTag:200];
        
        self.detailTextView  = [[UITextView alloc]initWithFrame:CGRectMake(90,40,320-10-90,44)];
        [self.detailTextView setTag:300];
        
        [cell addSubview:self.cityName_Label];
        [cell addSubview:self.detailTextView];
        [cell addSubview:self.cityImageView];
    }
    self.cityName_Label  = (UILabel *)[cell viewWithTag:100];
    self.cityImageView   = (UIImageView *)[cell viewWithTag:200];
    self.detailTextView  = (UITextView *) [cell viewWithTag:300];
    
    self.cityName_Label.text = [_textLabel_Marray objectAtIndex:indexPath.row];
    self.detailTextView.text = [[_subtitle_MArray objectAtIndex:indexPath.row] substringToIndex:30];
    [self.detailTextView setEditable:NO];
    [self.detailTextView setSelectable:NO];
    self.cityImageView.frame = CGRectMake(15, 10, 70, 70);
    
#endif

    NSLog(@"indexPath.row:%02i = %p", indexPath.row,cell);
    

    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44 + 44 + 6;
}


#pragma mark selectedRow:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    //NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    NSNotificationCenter *center  = [NSNotificationCenter defaultCenter];
    
    NSNumber *rowNumber = [[NSNumber alloc]initWithInt:indexPath.row];
    [center postNotificationName:@"createDetailView" object:nil userInfo:@{
                                                                        @"rowKey":rowNumber
                                                                           }];
}


@end
