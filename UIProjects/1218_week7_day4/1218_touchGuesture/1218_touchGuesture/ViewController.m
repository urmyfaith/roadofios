#import "ViewController.h"
#import "ZXView.h"
#import "ZXImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#if 1
    ZXView *myView  = [[ZXView alloc]init];
    myView.frame = CGRectMake(100,100,200,300);
    myView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:myView];
#endif
   
#if 0
    for (int i = 0; i < 16; i++) {
        CGFloat row     = i%4;
        CGFloat coloum  = i/4;
        CGFloat W = 80.0;
        CGFloat H = 120.0;
        
        CGFloat x = W * row;
        CGFloat y = H * coloum;
        
        ZXImageView *imageView = [[ZXImageView alloc]initWithFrame:CGRectMake(x,y,W,H)];
        NSString *string = [NSString stringWithFormat:@"10_%i.jpg",i];
        imageView.image = [UIImage imageNamed:string];
        imageView.isLarge = NO;
        imageView.myFrame = CGRectMake(x,y,W,H);
        imageView.delegate = self;             //设置代理
        imageView.userInteractionEnabled = YES;// 图像视图默认是不开启交互的.
        [self.view addSubview:imageView];
    }
#endif 
}

-(void)enlargeImageView:(ZXImageView *)imageView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    if (imageView.isLarge == YES) {
        imageView.frame = CGRectMake(0, 0, 320, 480);
        [self.view bringSubviewToFront:imageView];//把图片移动到最前的图层;
    }
    else{
        imageView.frame = imageView.myFrame;
    }
    imageView.isLarge = !imageView.isLarge;
}
@end
