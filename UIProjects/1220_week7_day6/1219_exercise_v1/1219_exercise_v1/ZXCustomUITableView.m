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
    if (nil == cell) {
        cell                            = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:cellIdentifier];
        
        UILabel *cityName_Label         = [[UILabel alloc]initWithFrame:CGRectMake(90,5,100,40)];
        cityName_Label.text             = [_textLabel_Marray objectAtIndex:indexPath.row];
        [cell addSubview:cityName_Label];

        // UIImageView *cityImageView   = [[UIImageView alloc]initWithImage:[_images_MArray objectAtIndex:indexPath.row]];//传UIImage数组,或者是传递图片名称数组.
        UIImage *cityImage = [UIImage imageNamed:[_images_MArray objectAtIndex:indexPath.row]];

        UIImageView *cityImageView      = [[UIImageView alloc]initWithImage:cityImage];
        cityImageView.frame = CGRectMake(10, 10, 70, 70);
        [cell addSubview:cityImageView];
        
        UITextView *detailTextView      = [[UITextView alloc]initWithFrame:CGRectMake(90,
                                                                                 40,
                                                                                 320-10-90,
                                                                                 44)];
        detailTextView.text             = [[_subtitle_MArray objectAtIndex:indexPath.row] substringToIndex:30];
        [detailTextView setEditable:NO];
        [detailTextView setSelectable:NO];
        [cell addSubview:detailTextView];
    }

    NSLog(@"row:%02i = %p", indexPath.row,cell);
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44 + 44 + 6;
}

#pragma mark selectedRow:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    NSNotificationCenter *center  = [NSNotificationCenter defaultCenter];
    
    NSNumber *rowNumber = [[NSNumber alloc]initWithInt:indexPath.row];
    [center postNotificationName:@"createDetailView" object:nil userInfo:@{
                                                                        @"rowKey":rowNumber
                                                                           }];
}


@end
