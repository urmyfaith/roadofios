UITableView 优化技巧

1.  使用cell 重用 和 高度cache。

2.  使用不透明的视图。
UIView 有个属性叫做 opaque 默认为 YES， 即不透明， If set to YES, the drawing system treats the view as fully opaque, which allows the drawing system to optimize some drawing operations and improve performanc， 从官方文档得知，设置为不透明的能优化体验， 并且对应的alpha 应该为1. 尽量不使用clearColor。
3.   减少视图数目，因为UIView本身会创建很多不需要的元素， 当存在严重性能问题时， 像图片， 文字等可以直接绘制在屏幕上， 采用CG api。
4.   不在cell bounds以外绘制视图。
5.    不在tableViewcellForRowAtIndexPath 做过多占用UI线程的操作， 例如下载图片， 处理大数据， 应该尽量以辅助线程去做这些， 随后通知UI线程刷新， 如下载图片放在子线程，当滚出屏幕的应该取消掉。
  滑动体验除了要cache图片到documents下以外， 如果还存在严重问题， 可以自己高度cache图片到内存当中以加快性能。  如将其放进NSDictionary 之中， 在不用时将其清除出内存， 而imageNamed方法只能缓存在bundle下的图片。
6.   如果图片尺寸不对也会造成卡顿现象， 即尺寸压缩在主线程做， 解决办法应该是对应尺寸。


1)使用 NSLog 和 CoreAnimation 进行测试。通过一个真实的例子,我让你了解了如何使用这两种工具来有效地对相关指标进行测试,以能够迅速地了解到问题本质,了解我们在每一步的优化之后都取得了哪些进展。

(2)适当地复用 Cell。这是相关性能优化的第一步,也是最重要的移步。这很容易实现,但是很多应用并没有这么做。因此,如果你有相关的性能问题,请多检查一下相关的部分是否已经做了这种优化。

(3)正确地缓存、复用图像和数据。另外一个重要的优化步骤就是,在返回或者显示一个 Cell 的时候,减少加载数据和图像的时间。

(4)减少逻辑计算时间。并不是只有 I/O 过程才会减慢或者阻塞 UI 线程;任何一种数据处理都有可能会有这种效果。因此,你需要尽量减少这一类数据处理。

(5)设置为不透明。这个小问题通常发生在开发者在视图中添加元素的时候。如果他们没有把每个视图都设置为非透明状态的话,那么渲染的时候就要对同一个点进行多次渲染。

(6)对高度进行缓存。这是开发者通常犯的另外一个小错误。每当需要一个新的 Cell 的时候,有两个主要方法要被调用。

(7)避免使用图形特效。在 Cell 上,有越多的图形特效,那么渲染的过程就会越缓慢。所以,你也应该对这点进行相关的测试。你应该使用 CoreAnimation来检查每个 UI 组件的渲染情况。

(8)编辑/重排的性能。通过使用代码绘制的技术来对滚动性能进行优化这种方式会在对 Cell 进行编辑或者有 Cell 相关的动画的时候造成一些问题。因此UIKit 和动画框架已经对子视图进行相关的优化了。如果你的 Cell 是自己绘制的,那么这些对子视图的相关优化就会失效。




如果你想要如丝般顺滑的效果，那么：
1、每次都看一下有没有能重用的 cell，而不是永远重新新建（这个是 UITableView 的常识）
2、Cell 里尽量不要用 UIView 而是全部自己用 drawRect 画（之前因为 iOS 有 bug，这样做会有性能上质的飞越。也有很多大神写过很多文章解释原理，有兴趣的自己去看看吧我就不做复制粘贴了。后来 iOS 也改掉了这个问题，这么做的效果就没那么明显了。）
3、图片载入放到后台进程去进行，滚出可视范围的载入进程要 cancel 掉
4、圆角、阴影之类的全部 bitmap 化，或者放到后台 draw 好了再拿来用
5、Cell 里要用的数据提前缓存好，不要现用现去读文件
6、数据量太大来不及一次读完的做一个 load more cell 出来，尽量避免边滚边读数据，这样就算是双核的 CPU 也难保不会抽


在iOS应用中，UITableView应该是使用率最高的视图之一了。iPod、时钟、日历、备忘录、Mail、天气、照片、电话、短信、Safari、App Store、iTunes、Game Center⋯几乎所有自带的应用中都能看到它的身影，可见它的重要性。
然而在使用第三方应用时，却经常遇到性能上的问题，普遍表现在滚动时比较卡，特别是table cell中包含图片的情况时。
实际上只要针对性地优化一下，这种问题就不会有了。有兴趣的可以看看LazyTableImages这个官方的例子程序，虽然也要从网上下载图片并显示，但滚动时丝毫不卡。
下面就说说我对UITableView的了解。不过由于我也是初学者，或许会说错或遗漏一些，因此仅供参考。

首先说下UITableView的原理。有兴趣的可以看看《About Table Views in iOS-Based Applications》。
UITableView是UIScrollView的子类，因此它可以自动响应滚动事件（一般为上下滚动）。
它内部包含0到多个UITableViewCell对象，每个table cell展示各自的内容。当新cell需要被显示时，就会调用tableView:cellForRowAtIndexPath:方法来获取或创建一个cell；而不可视时，它又会被释放。由此可见，同一时间其实只需要存在一屏幕的cell对象即可，不需要为每一行创建一个cell。
此外，UITableView还可以分为多个sections，每个区段都可以有自己的head、foot和cells。而在定位一个cell时，就需要2个字段了：在哪个section，以及在这个section的第几行。这在iOS SDK中是用NSIndexPath来表述的，UIKit为其添加了indexPathForRow:inSection:这个创建方法。
其他诸如编辑之类的就不提了，因为和本文无关。

介绍完原理，接下来就开始优化吧。

使用不透明视图。
不透明的视图可以极大地提高渲染的速度。因此如非必要，可以将table cell及其子视图的opaque属性设为YES（默认值）。
其中的特例包括背景色，它的alpha值应该为1（例如不要使用clearColor）；图像的alpha值也应该为1，或者在画图时设为不透明。
不要重复创建不必要的table cell。
前面说了，UITableView只需要一屏幕的UITableViewCell对象即可。因此在cell不可见时，可以将其缓存起来，而在需要时继续使用它即可。
而UITableView也提供了这种机制，只需要简单地设置一个identifier即可：
static NSString *CellIdentifier = @"xxx";
UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
}
值得一提的是，cell被重用时，它内部绘制的内容并不会被自动清除，因此你可能需要调用setNeedsDisplayInRect:或setNeedsDisplay方法。
此外，在添加table cell的时候，如果不需要动画效果，最好不要使用insertRowsAtIndexPaths:withRowAnimation:方法，而是直接调用reloadData方法。因为前者会对所有indexPaths调用tableView:cellForRowAtIndexPath:方法，即便该cell并不需要显示（不知道是不是bug），这就可能创建大量多余的cell。勘误：只是在模拟器上测试如此，真机调试时没有这种bug。
减少视图的数目。
UITableViewCell包含了textLabel、detailTextLabel和imageView等view，而你还可以自定义一些视图放在它的contentView里。然而view是很大的对象，创建它会消耗较多资源，并且也影响渲染的性能。
如果你的table cell包含图片，且数目较多，使用默认的UITableViewCell会非常影响性能。奇怪的是，使用自定义的view，而非预定义的view，明显会快些。
当然，最佳的解决办法还是继承UITableViewCell，并在其drawRect:中自行绘制：
- (void)drawRect:(CGRect)rect {    
    if (image) {
        [image drawAtPoint:imagePoint];
        self.image = nil;
    } else {
        [placeHolder drawAtPoint:imagePoint];
    }	
    
    [text drawInRect:textRect withFont:font lineBreakMode:UILineBreakModeTailTruncation];
}
不过这样一来，你会发现选中一行后，这个cell就变蓝了，其中的内容就被挡住了。最简单的方法就是将cell的selectionStyle属性设为UITableViewCellSelectionStyleNone，这样就不会被高亮了。
此外还可以创建CALayer，将内容绘制到layer上，然后对cell的contentView.layer调用addSublayer:方法。这个例子中，layer并不会显著影响性能，但如果layer透明，或者有圆角、变形等效果，就会影响到绘制速度了。解决办法可参见后面的预渲染图像。
不要做多余的绘制工作。
在实现drawRect:的时候，它的rect参数就是需要绘制的区域，这个区域之外的不需要进行绘制。
例如上例中，就可以用CGRectIntersectsRect、CGRectIntersection或CGRectContainsRect判断是否需要绘制image和text，然后再调用绘制方法。
预渲染图像。
你会发现即使做到了上述几点，当新的图像出现时，仍然会有短暂的停顿现象。解决的办法就是在bitmap context里先将其画一遍，导出成UIImage对象，然后再绘制到屏幕，详细做法可见《利用预渲染加速iOS设备的图像显示》。
不要阻塞主线程。
做到前几点后，你的table view滚动时应该足够流畅了，不过你仍可能让用户感到不爽。常见的现象就是在更新数据时，整个界面卡住不动，完全不响应用户请求。
出现这种现象的原因就是主线程执行了耗时很长的函数或方法，在其执行完毕前，无法绘制屏幕和响应用户请求。其中最常见的就是网络请求了，它通常都需要花费数秒的时间，而你不应该让用户等待那么久。
解决办法就是使用多线程，让子线程去执行这些函数或方法。这里面还有一个学问，当下载线程数超过2时，会显著影响主线程的性能。因此在使用ASIHTTPRequest时，可以用一个NSOperationQueue来维护下载请求，并将其maxConcurrentOperationCount设为2。而NSURLRequest则可以配合GCD来实现，或者使用NSURLConnection的setDelegateQueue:方法。
当然，在不需要响应用户请求时，也可以增加下载线程数，以加快下载速度：
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        queue.maxConcurrentOperationCount = 5;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    queue.maxConcurrentOperationCount = 5;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    queue.maxConcurrentOperationCount = 2;
}
此外，自动载入更新数据对用户来说也很友好，这减少了用户等待下载的时间。例如每次载入50条信息，那就可以在滚动到倒数第10条以内时，加载更多信息：
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (count - indexPath.row < 10 && !updating) {
        updating = YES;
        [self update];
    }
}
// update方法获取到结果后，设置updating为NO
还有一点要注意的就是当图片下载完成后，如果cell是可见的，还需要更新图像：
NSArray *indexPaths = [self.tableView indexPathsForVisibleRows];
for (NSIndexPath *visibleIndexPath in indexPaths) {
    if (indexPath == visibleIndexPath) {
        MyTableViewCell *cell = (MyTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        cell.image = image;
        [cell setNeedsDisplayInRect:imageRect];
        break;
    }
}
// 也可不遍历，直接与头尾相比较，看是否在中间即可。
最后还是前面所说过的insertRowsAtIndexPaths:withRowAnimation:方法，插入新行需要在主线程执行，而一次插入很多行的话（例如50行），会长时间阻塞主线程。而换成reloadData方法的话，瞬间就处理完了。


- http://www.cnblogs.com/lzl-sml/p/3731276.html

- http://www.zhihu.com/question/20382396

- http://www.keakon.net/2011/08/03/%E4%BC%98%E5%8C%96UITableView%E6%80%A7%E8%83%BD




