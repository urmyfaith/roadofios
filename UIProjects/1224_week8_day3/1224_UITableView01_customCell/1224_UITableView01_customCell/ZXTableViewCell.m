//
//  ZXTableViewCell.m
//  1224_UITableView01_customCell
//
//  Created by zx on 12/24/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXTableViewCell.h"
#import "ZXCityModel.h"


@implementation ZXTableViewCell

-(void)setMyModele:(ZXCityModel *)myModele{
    self.nameLabel.text = myModele.myName;
    self.detailTextLabel.text = myModele.myDetail;
    self.myImageView.image = [UIImage imageNamed:myModele.myImageName];
    
    _myModele = myModele;
}

+(ZXTableViewCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *indentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:indentifier];
    }

//    ZXCityModel *model = self.citys[indexPath.row];    
    return cell;
}

//通过代码初始化cell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //使用变量代表距离===>方便调整
        //从上往下,从左往右布局.
        
        //创建图片视图
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10,5,50,50)];
//        imageView.image = [UIImage imageNamed:@""];
        
        
        //[self addSubview:imageView];
        [self.contentView addSubview:imageView];//将子控件添加到contentView上,在进行增删改查的时候,子控件的位置变化进行一定程度的自适应.contentView是cell所特有的
        
        self.myImageView = imageView;
        
        
        //创建姓名视图
        UILabel *name  =  [[UILabel alloc]initWithFrame:CGRectMake(
                           CGRectGetMaxX(imageView.frame)+10,
                                                                   15,
                                                                   120,
                                                                   20
                           )];
        [self.contentView addSubview:name];
         self.nameLabel = name;

        //创建详细视图
        UILabel *detail = [[UILabel alloc]initWithFrame:CGRectMake(
                           CGRectGetMaxX(imageView.frame)+10,
                                                                   35,
                                                                   120,
                                                                   20
                                                                   )];
        [self.contentView addSubview:detail];
        self.nameLabel = detail;
    }
    return self;
}

//通过nib/xib初始化cell
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
