
| 文件名 |  描述 |
| ------------- | ------------ |
|[1212_ UITextFiled01](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1212_week6_day5/1212_ UITextFiled01)|  - text,font,backgoundColor |
|[1212_UITextField_loginDemo](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1212_week6_day5/1212_UITextField_loginDemo)| **textAlignment**, **placeholder**,**clearButtonMode** **leftView**,leftViewMode/rightView,rightViewMode  **inputView**/**inputAccessoryView**(自定义键盘上的视图) **secureTextEntry,keyboardType** |
|[1212_UITextField02](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1212_week6_day5/1212_UITextField02)| ***contentHorizontalAlignment***(内容对齐方式)**autocapitalizationType**(大写提示),**autocorrectionType**(纠错提醒),**adjustsFontSizeToFitWidth**(调整文本自适应),**minimumFontSize**(最小字体) |
|[1212_UITextField_loginDemo_improve01](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1212_week6_day5/1212_UITextField_loginDemo_improve01)| 限制输入框的输入长度,验证邮箱的合法性 |
|[1212_UITextField_loginDemo_improve02](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1212_week6_day5/1212_UITextField_loginDemo_improve02)| 将按钮,标签,输入框封起来 |
|[TextField.pdf](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1212_week6_day5/TextField.pdf)| 网上有关TextField文档 |

# UITextField

 - create,pos,baorderSytle,backgroundColor,text:
 
 ```
	UITextField *textFiled = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 160, 40)];
	textFiled.center = CGPointMake(160,120);
   textFiled.borderStyle = UITextBorderStyleRoundedRect;
   textFiled.backgroundColor = [UIColor whiteColor];
 ```

 
 - text,font,**textAlignment**,***contentHorizontalAlignment***(内容对齐方式) **placeholder**,**clearButtonMode**
 
 - **leftView**,leftViewMode/rightView,rightViewMode
 - **autocapitalizationType**(大写提示),**autocorrectionType**(纠错提醒),**adjustsFontSizeToFitWidth**(调整文本自适应),**minimumFontSize**(最小字体)  
 - **inputView**/inputAccessoryView(自定义键盘上的视图)

 - **secureTextEntry,keyboardType**
 
 -  使用正则表达式判断邮箱的合法性
 
 ```
 -(BOOL)isValidateWithEmail:(NSString *)email{
    //正则表达式
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";   
    //正则表达式放入语境
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [pre evaluateWithObject:email];
}
[self isValidateWithEmail:self.userNameTextField.text]
 ```
 
 - 限制输入框的输入长度,delegate--->UITextFieldDelegate
 
 - use this to hidden Keyboard when cilick 'return'
  
 ```
 @interface ZXViewController ()<UITextFieldDelegate>
 textFiled.delegate = self;
 -(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
 ```
 
 ```
 //当输入框中的字符改变的时候调用
-(BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string
{
    if( [textField isEqual:self.userNameTextField ] )
	{
	//1.先获取改变前的字符串
	//注意:这个字符串应该是可变的字符串
	NSMutableString *mutString = [NSMutableString stringWithFormat:@"%@",self.userNameTextField.text];
	//将改变的字符串插入到源字符串中
	[mutString insertString:string atIndex:range.location];
	//判断,当新的字符串的长度大于10的时候,不让将此字符串添加进原字符串.
	//返回NO,添加失败,返回YES,添加成功.
	if ([mutString length] > 10 )
		return NO;
	else
		return YES;
	}
	return YES;
}
 ```

 
 
 