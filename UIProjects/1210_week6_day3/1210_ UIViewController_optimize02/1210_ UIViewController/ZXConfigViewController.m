#import "ZXConfigViewController.h"

#import "ZXAllMethod.h"

@implementation ZXConfigViewController


/**
 *  1.传值的标签
 *  2.当前视图的标签,
 *  3.上一页的按钮
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor brownColor];
    
    UILabel *userName = [UILabel labelWithFrame:CGRectMake(100,20,120,40)
                                       withText:self.name withTag:1000
                            withBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:userName];
    
    UILabel *label = [UILabel labelWithFrame:CGRectMake(100,20,120,40)
                                    withText:@"config view" withTag:1000
                         withBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:label];
    
    
    UIButton *preView = [UIButton buttonWithFrame:CGRectMake(100, 150, 120, 40)
                                        withTitle:@"back" withType:UIButtonTypeSystem
                                       withTarget:self
                                       withMethod:@selector(backToMain)];
    [self.view addSubview:preView];
    
    
}


-(void)backToMain{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:0 forKey:@"mySignal"];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
