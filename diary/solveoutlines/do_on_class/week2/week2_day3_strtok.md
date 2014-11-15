**NAME**

     strtok, strtok_r -- string tokens

**LIBRARY标准库**

     Standard C Library (libc, -lc)

**SYNOPSIS摘要语法**

     #include <string.h>

     char * strtok(char *restrict str, const char *restrict sep);

     char * strtok_r(char *restrict str, const char *restrict sep, char **restrict lasts);

* str	  待分隔的字符
* sep  包含分隔符的字符串（就是说可以多个分隔符）

**DESCRIPTION描述** 


     The strtok() function is used to isolate sequential tokens in a null-terminated string, str. 该方法用于使用分隔符来分离字符串。 These tokens are separated in the string by at least one of the characters in sep.分隔符至少是sep（字符串）中的一个。

> **The first time that strtok() is called, str should be specified; subsequent calls, wishing to obtain further tokens from the same string, should pass a null pointer instead. 第一次调用strtok时需要str参数，后续的调用需要使用NULL指针而不是str**。 

	The separator string, sep, must be supplied each time, and may change between calls.分隔符（sep）每次都需要提供，而且在多次调用的时候可以改变分隔符。

     The implementation will behave as if no library function calls strtok().实现就像没有库函数调用strtok。

     The strtok_r() function is a reentrant version of strtok(). strtok_r函数是strtok的一个递归调用版本。
     
     The context pointer last must be provided on each call. 上下文指针在每次调用的时候都要提供。（上下文指针用在strtok_r函数中，这个函数多用与嵌套（递归）等形式中，但是对一个字符串分割的时候，第二次传入的参数时NULL而不是我们要分隔的字符串str，那么在嵌套／递归的时候函数怎么区分是在分隔哪个字符串？这个时候函数就可以使用传入的上下文指针来确定分割的是哪个字符串了。）　
     
      The strtok_r() function may also be used to nest two parsing loops within one another, as long as separate context pointers are used.只要有不同的内容指针，strtok_r函数就可以用来嵌套

     The strtok() and strtok_r() functions return a pointer to the beginning of each subsequent token in the string, after replacing the token itself with a NUL character.  When no more tokens remain, a null pointer is returned.首先将分隔标志符位置替换为NULL，然后返回一个（指向每一个子字符串分隔符分隔后的字符串的首字符的）指针。当没有字符串里没有分隔标志符的时候，返回一个NULL指针。
     
     
#  **用法实例**

##  用空格分隔字符串

```
  1 #include <stdio.h>
  2 #include <string.h>
  3 
  4 #define NUM 1024
  5 
  6 int main()
  7 {
  8     char str[NUM]="God is a girl";
  9     char *p=str;
 10     char *sep=" ";
 11 
 12 
 13     puts(strtok(p,sep));
 14 
 15     puts(strtok(NULL,sep));
 16 
 17     puts(strtok(NULL,sep));
 18 
 19     puts(strtok(NULL,sep));
 20 
 21     return 0;
 22 }
```

output is :

> God

> is

> a

> girl

**The first time that strtok() is called, str should be specified; subsequent calls, wishing to obtain further tokens from the same string, should pass a null pointer instead. 第一次调用strtok时需要str参数，后续的调用需要使用NULL指针而不是str**

上面的改写成循环就是：

```
  1 #include <stdio.h>
  2 #include <string.h>
  3 
  4 #define NUM 1024
  5 
  6 int main()
  7 {
  8     char str[NUM]="God is a girl";
  9     char *p=str;
 10     char *sep=" ";
 11 
 12     for (p =strtok(p,sep); p; p=strtok(NULL,sep))
 13         puts(p);
 14     
 15     return 0;
 16 }                                                                                                                                                                                                                                                                                       
```

##   嵌套分割字符串时候的使用

```
  1 #include <stdio.h>
  2 #include <string.h>
  3 
  4 int main()
  5 {
  6     char test[80], blah[80];
  7     char *sep = "\\/:;=-";
  8     char *word, *phrase, *brkt, *brkb;
  9 
 10     strcpy(test, "This;is.a:test:of=the/string\\tokenizer-function.");
 11 
 12     for (word = strtok_r(test, sep, &brkt);
 13             word;
 14             word = strtok_r(NULL, sep, &brkt))
 15     {
 16         strcpy(blah, "blah:blat:blab:blag");
 17 
 18         for (phrase = strtok_r(blah, sep, &brkb);
 19                 phrase;
 20                 phrase = strtok_r(NULL, sep, &brkb))
 21         {
 22             printf("So far we're at %s:%s\n", word, phrase);
 23         }
 24     }
 25 
 26     return 0;
 27 }
```

the output is :

```
So far we're at This:blah
So far we're at This:blat
So far we're at This:blab
So far we're at This:blag
So far we're at is.a:blah
So far we're at is.a:blat
So far we're at is.a:blab
So far we're at is.a:blag
So far we're at test:blah
So far we're at test:blat
So far we're at test:blab
So far we're at test:blag
So far we're at of:blah
So far we're at of:blat
So far we're at of:blab
So far we're at of:blag
So far we're at the:blah
So far we're at the:blat
So far we're at the:blab
So far we're at the:blag
So far we're at string:blah
So far we're at string:blat
So far we're at string:blab
So far we're at string:blag
So far we're at tokenizer:blah
So far we're at tokenizer:blat
So far we're at tokenizer:blab
So far we're at tokenizer:blag
So far we're at function.:blah
So far we're at function.:blat
So far we're at function.:blab
So far we're at function.:blag

```

* test 存放外层待分割的字符串

   *  word 指向每次分割test后，得到的分割标志符位置前单词的首地址，的一个指针

* blah 存放内存带分割的字符串

   *  phrase 指向每次分割blah后，得到的分割标志符位置前单词的首地址，的一个指针

* sep 存放分割标志符

* brkt 用于在外层分割的时候，确定是分割的是外层字符串的一个上下文指针

* brkb 也是一个上下文指针，用于区分分割的是内层字符串



可以看到

```
外层循环   strtok_r(NULL,sep,&brkt)
内层循环	  strtok_r(NULL,sep,&brkb)
```

仅仅是上下文指针不同，通过上下文指针，明确了在嵌套的时候分割的是哪个字符串。



 


