//
//  ZXAppDelegate.m
//  1208_UIButton_calculator
//
//  Created by zx on 12/8/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ZXAppDelegate.h"

@implementation ZXAppDelegate


#pragma mark entry
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    // 1.layout 2.calcultor
    [self layoutCalculatorUI];
    
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
    return YES;
}

/**
 *  1.label
 *  2.button.
 */
-(void)layoutCalculatorUI{
    
    //======label=====
    //stautsBar 20px
    //blow it 10px
    // 320-5*10=270 270/4 = 67.5px
    //320-2*10 = 300;
    CGFloat statusGap = 10;
    CGFloat statusBarHeight = 20;
    CGFloat gap = 10;
    CGFloat screenWidth = 320;
    CGFloat showLabelHeight = 50;
    CGFloat showLabelWidth = screenWidth - gap*2;
    
    
    self.showLabel.frame = CGRectMake(gap,statusBarHeight + statusGap,showLabelWidth,showLabelHeight);
    self.showLabel.backgroundColor = [UIColor whiteColor];
    self.showLabel.textAlignment = NSTextAlignmentRight;
    //default value:
    self.showLabel.text = @"0";
    [self.window addSubview:self.showLabel];
    
    
    //===button=====
    //
    NSArray *titlesArray = @[@"mc",@"m+",@"m-",@"mr",
                             @"AC",@"+/-",@"*",@"/",
                             @"7",@"8",@"9",@"-",
                             @"4",@"5",@"6",@"+",
                             @"1",@"2",@"3",@"=",
                             @"0",@"",@".",@""
                             ];
    for (int i = 0; i < 24; i++) {
        CGFloat H = i % 4;
        CGFloat L = i / 4;
        CGFloat buttonW =  (screenWidth -gap*5 )/4;
        CGFloat buttonH = 40;
        CGFloat buttonX =  gap + (gap +buttonW)*H;
        CGFloat buttonY =  CGRectGetMaxY(self.showLabel.frame)+ gap + (gap +buttonH)*L;
        
        
        if (i == 19) {
            buttonH = buttonH*2 + gap;
        }
        if (i == 20 ) {
            buttonW = buttonW*2 + gap;
        }
        if (i == 21 || i ==23) {
            continue;
        }
        CGRect rect = CGRectMake(buttonX,buttonY,buttonW,buttonH);
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag  = i;
        
        button.frame = rect;
        [button setTitle:titlesArray[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:[UIColor whiteColor]];//设置背景颜色.
        
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:10];//radius of circle
        [button.layer setBorderWidth:0];
        
        [self.window addSubview:button];
    }
}


#pragma mark  lazy load.
/**
 *  lazy load
 *
 *  @return _expression
 */
-(NSMutableString *)expression{
    if (_expression == nil) {
        _expression = [[NSMutableString alloc]init];
    }
    return _expression;
}


-(UILabel *)showLabel{
    if (_showLabel == nil) {
        _showLabel = [[UILabel alloc]init];
    }
    return _showLabel;
}

#pragma mark logicPartWhenButtonClikedThenChangeLebelText
/**
 *  1. get the Value of Cilicked Button.
 *  2. if is 0~9,add to 'expression'
 *  3. if is +-* /
 *     a) not first + - * / ==> add to 'expression'
 *     b) the second ===> calculate expression value.
 *     c) continues + - * / ===>break / or reaplce operator.
 *  4. if is =      ===>  calculate expression value.
 *  5. change labele text.
 */
-(void)clickedButton:(UIButton *)button{
    
    NSString *btnTitle = [[NSString alloc]initWithString:[button currentTitle]];
    NSLog(@"clicked %@",btnTitle);
    switch (button.tag) {
        case 0:
            NSLog(@"mc clicked");
            break;
            //0~9
        case 8:
        case 9:
        case 10:
        case 12:
        case 13:
        case 14:
        case 16:
        case 17:
        case 18:
        case 20:
            [self.expression appendString:btnTitle];
            break;
            //+-*/
        case 6:
        case 7:
        case 11:
        case 15:
            //  12++23 --> 12+23
            if ([self.expression characterAtIndex:([self.expression length]-1)] == '+' ||
                [self.expression characterAtIndex:([self.expression length]-1)] == '-' ||
                [self.expression characterAtIndex:([self.expression length]-1)] == '*' ||
                [self.expression characterAtIndex:([self.expression length]-1)] == '/'){
                break;
            }
            [[self expression] appendString:btnTitle];
            
            if ([self countOpeatorWithString:[self expression]] == 2)
                [self calculateResult];
            break;
            
            // =
        case 19:
            [self.expression appendString:btnTitle];
            [self calculateResult];
            // NSLog(@"dd->%@",[self expression]);
        default:
            break;
    }
    self.showLabel.text =  self.expression;
    NSLog(@"current expresstion: %@",[self expression]);
}


/**
 *  calculate expression value.
 *  1. spilt string into array          1+2=    >[1,2,""]
 *  2. get operator and calcute value    + - / * ?   ===> 1+2
 *  3. if endsWith
 *        a) "=" , expression<==result
 *        b)  + / - * ,expression <= reslute + ?
 */
-(void)calculateResult{
    NSMutableString *tempExpression = [[NSMutableString alloc]initWithString:self.expression];
    float result = 0;
    NSCharacterSet *mySet = [NSCharacterSet characterSetWithCharactersInString:@"+-*/="];
    NSArray *newArray = [tempExpression componentsSeparatedByCharactersInSet:mySet];
    // NSLog(@"%@",newArray);
    
    for (int i = 0; i < [tempExpression length]-1; i++) {
        char ch =[tempExpression characterAtIndex:i];
        if (!( ch>='0' && ch <='9') ) {
            switch (ch) {
                case '+':
                    result =[newArray[0] floatValue] + [newArray[1] floatValue];
                    break;
                case '-':
                    result =[newArray[0] floatValue] - [newArray[1] floatValue];
                    break;
                case '*':
                    result =[newArray[0] floatValue] * [newArray[1] floatValue];
                    break;
                case '/':
                    result =[newArray[0] floatValue] / [newArray[1] floatValue];
                default:
                    break;
            }
        }
    }
    [self setExpressionValue:result];
    char lastOperator = [tempExpression characterAtIndex:([tempExpression length]-1)];
    //  NSLog(@"lastexpreion = %c",lastOperator);
    
    if (lastOperator == '=') {
        self.expression = [[NSMutableString alloc]initWithString:
                           [NSString stringWithFormat:@"%.f",[self expressionValue]
                            ]];
    }
    else
    {
        self.expression = [[NSMutableString alloc]initWithString:
                           [NSString stringWithFormat:@"%.f%c",[self expressionValue],lastOperator
                            ]];
    }
    //  NSLog(@"cal->%@",self.expression);
    
}

/**
 *  count how many time "+ - * /" in string.
 */
-(NSInteger)countOpeatorWithString:(NSMutableString *)mutString
{
    // NSMutableString *mutString = [[NSMutableString alloc]initWithString:@"123+24+"];
    NSInteger count = 0;
    for (int i = 0; i < [mutString length]; i++)
    {
        char ch = [mutString characterAtIndex:i];
        if (ch == '+' || ch == '-' ||
            ch == '*' || ch == '/'
            ) {
            count ++;
        }
    }
    return count;
}



#pragma mark DelegateMethd
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
