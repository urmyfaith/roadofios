~~~objectivec
- This works for both iOS 6.1 and iOS 7:

- (void)textViewDidChange:(UITextView *)textView
{
    CGFloat fixedWidth = textView.frame.size.width;
    CGSize newSize = [textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = textView.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    textView.frame = newFrame;
}
If you want support for iOS 6.1 then you should also:

textview.scrollEnabled = NO;
shareedit


~~~

http://stackoverflow.com/questions/50467/how-do-i-size-a-uitextview-to-its-content/26599389#26599389


## 自动调整TextView高度

~~~objectivec

`advancedUI/week14/FashionShow/FashionShow/Controller/PostCommentViewController.m`

- (void)textViewDidChange:(UITextView *)textView{
    
    //第一步: 固定宽度
    CGFloat fixedWidth = _textView.frame.size.width;
    
    //第二步: 调整高度
    CGSize newSize = [_textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    
    //第三步: 得到之前的frame
    CGRect newFrame = _textView.frame;
    
    //第四步: 更改frame
    if (newSize.height + wordsCount_label_height >= textView_height) {
        newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height + wordsCount_label_height);
       
        //第五步: 应用新的frame
        _textView.frame = newFrame;

        _wordsCount_label.frame = CGRectMake(textView_left_gap,
                                             _textView.frame.size.height- wordsCount_label_height ,
                                             _textView.frame.size.width-2*textView_left_gap,
                                             wordsCount_label_height);
    }
}
~~~

## 限制UITextView输入字数

限制长度

~~~objectivec
/**
 *  限制输入长度
 *
 思路:先得到原来的字符===>假设插入字符====>根据长度判断是否应该插入.
 *  @param textView 输入框
 *  @param range    光标位置+输入的长度
 *  @param text     输入的字符
 *
 *  @return yes,可以输入,no,不能输入
 */
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{

#if 1
    //将改变的字符串插入到源字符串中
    NSMutableString *mutString = [NSMutableString stringWithFormat:@"%@",_textView.text];
    [mutString insertString:text atIndex:range.location];
    //NSLog(@"mutString = %@ length=%lu",mutString,mutString.length);

    if ([mutString length] > 200 )
        return NO;
#else
    NSString * toBeString = [_textView.text stringByReplacingCharactersInRange:range withString:text];
    //NSLog(@"toBeString = %@ length=%lu",toBeString,toBeString.length);
    if ([toBeString length] > 200 )
        return NO;
#endif

    return YES;
}
~~~


## UITextView的placeHolder实现

~~~objectivec
Easy way, just create placeholder text in UITextView by using the following UITextViewDelegate methods:

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"placeholder text here..."]) {
         textView.text = @"";
         textView.textColor = [UIColor blackColor]; //optional
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"placeholder text here...";
        textView.textColor = [UIColor lightGrayColor]; //optional
    }
    [textView resignFirstResponder];
}
just remember to set myUITextView with the exact text on creation e.g.

UITextView *myUITextView = [[UITextView alloc] init];
myUITextView.delegate = self;
myUITextView.text = @"placeholder text here...";
myUITextView.textColor = [UIColor lightGrayColor]; //optional
and make the parent class a UITextViewDelegate before including these methods e.g.

@interface MyClass () <UITextViewDelegate>
@end

~~~

- http://stackoverflow.com/questions/1328638/placeholder-in-uitextview


