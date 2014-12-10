#import "ZXMainViewController.h"
#import "ZXConfigViewController.h"

#import "ZXAllMethod.h"

@implementation ZXMainViewController

/**
 *  1.传值的标签
 *  2.当前视图的标签,
 *  3.上一页的按钮,下一页的按钮
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
   
    UILabel *userName = [UILabel labelWithFrame:CGRectMake(100,80,120,40)
                                    withText:self.name withTag:1000
                         withBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:userName];

    UILabel *label = [UILabel labelWithFrame:CGRectMake(100,20,120,40)
                                    withText:@"the mian view" withTag:1000
                         withBackgroundColor:[UIColor redColor]];
    [self.view addSubview:label];
    

    UIButton *preView = [UIButton buttonWithFrame:CGRectMake(100, 150, 120, 40)
                                        withTitle:@"back" withType:UIButtonTypeSystem
                                       withTarget:self
                                       withMethod:@selector(backToLogin)];
    [self.view addSubview:preView];
    
    UIButton *nextView = [UIButton buttonWithFrame:CGRectMake(100, 200, 120, 40)
                                         withTitle:@"next" withType:UIButtonTypeSystem
                                        withTarget:self
                                        withMethod:@selector(jumpIntoConfigView)];
    [self.view addSubview:nextView];
}

-(void)backToLogin{
#if 0
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger  signal = [defaults integerForKey:@"mySignal"];
    if (signal == 1) {
        ZXMainViewController *main = [[ZXMainViewController alloc]init];
        [self dismissViewControllerAnimated:YES completion:nil];
        [self presentViewController:main animated:YES completion:nil];
    }
    else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
#endif
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)jumpIntoConfigView{
    ZXConfigViewController *configView = [[ZXConfigViewController alloc]init];
    configView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    configView.name = self.name;
    
    [self presentViewController:configView animated:YES completion:nil];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
