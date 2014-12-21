
# UITextField

 - create,pos,baorderSytle,backgroundColor,text:
 
 ```
	UITextField *textFiled = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 160, 40)];
	textFiled.center = CGPointMake(160,120);
   textFiled.borderStyle = UITextBorderStyleRoundedRect;
   textFiled.backgroundColor = [UIColor whiteColor];
 ```

 
 - text,font,**textAlignment**,**placeholder**,**clearButtonMode**
 
 - **leftView**,leftViewMode/rightView,rightViewMode
 
 - **inputView**/inputAccessoryView

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

 
 
 