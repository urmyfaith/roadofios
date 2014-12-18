#import "ZXCustomProgressView.h"

/**
 *  模仿progress,自己写一个
 分析:
 1.创建一个UIView的子类,代表自制progress
 2.
 属性:
 开始的进度   ---->值在0-1范围
 背景图片    ----->frame宽度不会改变
 前景图片    ----->freame宽度随着进度改变
 行为:
 实现动画:让图片的宽度随着进度的改变从最小到最大
 
 */
@implementation ZXCustomProgressView

-(void) setBackgroundImage:(UIImage *)backImage{
    _backgroundImage = backImage;
    _imageViewBackground.image              = _backgroundImage;
}

-(void) setForheadImage:(UIImage *)forheadImage{
    _forheadImage = forheadImage;
    _imageViewForhead.image                 = _forheadImage;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageViewBackground                = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width,10)];

        _imageViewForhead                   = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width,10)];
        
        [self addSubview:_imageViewBackground ];
        [self addSubview:_imageViewForhead];
        
    }
    return self;
}

//重写set方法,设置进度<===>frame的宽度改变
-(void)setProgress:(CGFloat )progress{
    _progress               = progress;
    _imageViewForhead.frame = CGRectMake(0,
                                         0,
                                         self.frame.size.width * progress,
                                         10);
}

//完成动画
-(void)setProgress:(CGFloat)progress animated:(BOOL)animated{
    if (animated) {
        [UIView  beginAnimations:nil context:nil];
        [UIView  setAnimationDuration:2.0];
        self.progress = progress;
        [UIView  commitAnimations];
        
    }else{
        self.progress =  progress;
    }
}

@end
