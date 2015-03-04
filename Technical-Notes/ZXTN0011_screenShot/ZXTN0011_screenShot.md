`roadofios/Technical-Notes/ZXTN0011_screenShot/screenShotDemo/screenShotDemo.xcodeproj/`

`roadofios/Technical-Notes/ZXTN0011_screenShot/screenShotDemo/screenShotDemo/ZXViewController.m`



~~~objectivec
CGRect rect=CGRectMake(_xstep*j, _ystep*i, _xstep, _ystep);

CGImageRef imageRef=CGImageCreateWithImageInRect([image CGImage],rect);

UIImage* elementImage=[UIImage imageWithCGImage:imageRef];

UIImageView*_imageView=[[UIImageView alloc] initWithImage:elementImage];
~~~



~~~objectivec
- (UIImage *)CutImageWithImage:(UIImage *)image withRect:(CGRect)rect
{
    //使用CGImageCreateWithImageInRect方法切割图片，第一个参数为CGImage类型，第二个参数为要切割的CGRect
    CGImageRef cutImage = CGImageCreateWithImageInRect(image.CGImage, rect);
    //将切割出得图片转换为UIImage
    UIImage *resultImage = [UIImage imageWithCGImage:cutImage];
    return resultImage;
}
~~~




~~~objectivec
方法1：

 
- (void)drawRect:(CGRect)rect {
CGContextRef context=UIGraphicsGetCurrentContext();
//设置倒立
CGContextRotateCTM(context,M_PI);
//重新设置坐标  self.bounds获取整个屏幕的区域。
CGContextTranslateCTM(context, -self.bounds.size.width,-self.bounds.size.height);
//CGContextScaleCTM(context, 1.0, -1.0);
CGRect imageRect=recti;
//画底图
CGContextDrawImage(context, imageRect, image);
//填充颜色
CGContextSetRGBStrokeColor(context,0.0,0.0,0.0,1.0);
CGContextFillRect(context,self.bounds);
CGRect ret=CGRectMake(0.0, 0.0, 180, 180);
//裁剪
CGContextClipToRect(context, ret);
 
//获取裁剪区域
CGRect boudsc=CGContextGetClipBoundingBox(context);
int cleft = boudsc.origin.x;
int ctop = boudsc.origin.y;
int cwidth = boudsc.size.width;
int cheight = boudsc.size.height;
 
//画出裁剪区域
CGContextDrawImage(context, self.bounds, image);
}
 
 
方法2：
UIImage *image=[UIImage imageNamed:@"**.png"];
创建矩形
根据矩形创建image
uiimageview.image=[UIimage imagewidthCGImage:CGImageCreateWidthImageInRect:([image CGImage],矩形)]；
将image添加到imageview中
~~~