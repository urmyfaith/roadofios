#import "ZXLoginViewController.h"
#import "ZXMainViewController.h"
#import "ZXAllMethod.h"

@implementation ZXLoginViewController


/**
 *  1.传值的标签
 *  2.当前视图的标签
 *  3.下一页的按钮
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor grayColor];

    UILabel *userName = [UILabel labelWithFrame:CGRectMake(100,20,120,40)
                                    withText:@"tom" withTag:100
                         withBackgroundColor:[UIColor redColor]];
    [self.view addSubview:userName];

    
    UILabel *label = [UILabel labelWithFrame:CGRectMake(100,100,120,40)
                                       withText:@"login view" withTag:100
                            withBackgroundColor:[UIColor yellowColor  ]];
    [self.view addSubview:label];
    

    UIButton *nextView = [UIButton buttonWithFrame:CGRectMake(100, 150, 120, 40)
                                         withTitle:@"next" withType:UIButtonTypeSystem
                                        withTarget:self
                                        withMethod:@selector(jumpIntoMain)];
     [self.view addSubview:nextView];
}


-(void)jumpIntoMain{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:1 forKey:@"mySignal"];
    
    ZXMainViewController *mainView = [[ZXMainViewController alloc]init];
    mainView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    UILabel *lable4name = (UILabel *)[self.view viewWithTag:100];
    mainView.name = lable4name.text;
    
    [ self presentViewController:mainView animated:YES completion:nil];
}


#pragma mark ----内存管理警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
