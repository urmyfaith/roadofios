2014-12-11

# UIViewController的练习 



- NSUserDefaults 

```
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:0 forKey:@"mySignal"];
    [defaults setObject:nil forKey:@"userName"];
     NSInteger  signal = [defaults integerForKey:@"mySignal"];
```

use this to save data to disk when program exit.

~

- UIViewController

```
 [ self presentViewController:detailView animated:YES completion:nil];
 [ self dismissViewControllerAnimated:YES completion:nil];
```
forward page and backward page  modally.






