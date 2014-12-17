//
//  general_table_view.m
//  1214_UITableView01
//
//  Created by zx on 12/14/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "general_table_view.h"

@implementation general_table_view

- (NSMutableArray*)textLabel_MArray{
    if (_textLabel_MArray == nil) {
        _textLabel_MArray = [NSMutableArray array];
    }
    return _textLabel_MArray;
}
- (NSMutableArray*)images_MArray{
    if (_images_MArray == nil) {
        _images_MArray = [NSMutableArray array];
    }
    return _images_MArray;
}
- (NSMutableArray*)subtitle_MArray{
    if (_subtitle_MArray == nil) {
        _subtitle_MArray = [NSMutableArray array];
    }
    return _subtitle_MArray;
}

//@property (nonatomic, copy)NSMutableArray * textLabel_MArray;
//
//@property (nonatomic, copy)NSMutableArray * images_MArray;
//
//@property (nonatomic, copy)NSMutableArray * subtitle_MArray;
//


#pragma mark ------initMethod
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate   = self;
        self.dataSource = self;
    }
    return  self;
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate   = self;
        self.dataSource = self;
    }
    return  self;
}

-(void)setTableViewFrame:(CGRect)tableViewFrame{
    self.frame = tableViewFrame;
}

#pragma mark delegateMethod: MUST

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_textLabel_MArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"cellIndentifier";
    UITableViewCell *cell           = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
//---------------
#if 1
           cell                    = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                           reuseIdentifier:cellIdentifier];
#endif
#if 0
           cell                    = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1
                                                           reuseIdentifier:cellIdentifier];
#endif
#if 0
           cell                    = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2
                                                           reuseIdentifier:cellIdentifier];
#endif
#if 0
           cell                    = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                                           reuseIdentifier:cellIdentifier];
#endif
//-----------------
#if 1
        cell.accessoryType      = UITableViewCellAccessoryNone;
#endif
#if 0
        cell.accessoryType      = UITableViewCellAccessoryDisclosureIndicator;
#endif
#if 0
        cell.accessoryType      = UITableViewCellAccessoryDetailDisclosureButton;
#endif
#if 0
        cell.accessoryType      = UITableViewCellAccessoryCheckmark;
#endif
#if 0
        cell.accessoryType      = UITableViewCellAccessoryDetailButton;
#endif
    }
    cell.textLabel.text         = [_textLabel_MArray objectAtIndex:indexPath.row];
    cell.imageView.image        = [_images_MArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text   = [_subtitle_MArray objectAtIndex:indexPath.row];
    return  cell;
}

#pragma mark delegateMethod: optional
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#if 0
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"header";
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"footer";
}
#endif



@end
