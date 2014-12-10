#import "ZXConfigViewController.h"
#import "UIButton+addMethod.h"
#import "UILabel+addMethod.h"

@interface ZXConfigViewController ()

@end

@implementation ZXConfigViewController

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
