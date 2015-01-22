//
//  MainViewController.m
//  MyMagazine
//
//  Created by zx on 1/21/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "MainViewController.h"
#import "ZipArchive.h"
#import "GDataXMLNode.h"
#import "PageView.h"


@interface MainViewController ()

@end

@implementation MainViewController
{
    UIScrollView *_mainScrollView;
    
    //用来存放所有的pageView对象
    NSMutableArray *_pageViewArray;
    
    //记录当前也下标
    int _currentIndex;
    
    //需要加载的页数;
    int _maxPageNumber;
    
    //已经加载的页面数组
    NSMutableArray *_loadPaegViewArray;
    
    //subView的黑条
    UIView *_titleView;
    
    //subView的引导滚动条
    UIScrollView *_subScrollView;
    
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //1.解压缩资源包
    [self zipFile];

    //2.布局UI
    _pageViewArray = [[NSMutableArray alloc] init];
    [self layoutUI];
    
    //3.加载界面(当前页+前,后页)
    _currentIndex = 0;
    _maxPageNumber = 2;
    _loadPaegViewArray = [[NSMutableArray alloc]init];
    [self loadPageView];
    
    //4.添加手势
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showSubView)];
    
    tgr.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:tgr];
    
    //5.加载subView界面
    [self layoutSubUI];
    
}

-(void)layoutSubUI{
    _titleView = [[UIView alloc]init];
    _titleView.frame = CGRectMake(0, -44, 768, 44);
    _titleView.backgroundColor =[UIColor colorWithRed:0   green:0 blue:0 alpha:0.8];
    [self.view addSubview:_titleView];
    
#pragma mark  -----2015-01-22_17_43_01
    
    CGFloat gap = 5.0f;
    
    UIImage *homeImage = [UIImage imageNamed:@"sun"];
    UIButton *homeButton = [[UIButton alloc] init];
    homeButton.tag = 100;
    homeButton.frame = CGRectMake(gap, gap,40,40);
    [homeButton setImage:homeImage forState:UIControlStateNormal];
    [homeButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *listImage = [UIImage imageNamed:@"badge"];
    UIButton *listButton = [[UIButton alloc]init];
    listButton.tag = 101;
    listButton.frame= CGRectMake(CGRectGetMaxX(homeButton.frame) + gap, gap, 40, 40);
    [listButton setImage:listImage forState:UIControlStateNormal ];
    [listButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *musicImage = [UIImage imageNamed:@"music-note"];
    UIButton *musicButton = [[UIButton alloc]init];
    musicButton.tag = 102;
    musicButton.frame= CGRectMake(self.view.bounds.size.width-40-gap, gap, 40, 40);
    [musicButton setImage:musicImage forState:UIControlStateNormal ];
    [musicButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [_titleView addSubview:homeButton];
    [_titleView addSubview:listButton];
    [_titleView addSubview:musicButton];
    
    
    _subScrollView = [[UIScrollView alloc]init];
    _subScrollView.frame = CGRectMake(0, 1024, 768, 200);
    _subScrollView.contentSize = CGSizeMake(150*_pageViewArray.count, 200);

    int i = 0 ;
    for (PageView *pv in _pageViewArray) {
        //
        UIImage *subImage = [[UIImage alloc]
                             initWithContentsOfFile:[NSString stringWithFormat:@"%@/Library/Caches/book/thumbnail/%@.jpg",NSHomeDirectory(),pv.pageViewId]];
        UIImageView *subImageView = [[UIImageView alloc]initWithImage:subImage];
        subImageView.frame = CGRectMake(150*i,0, 150, 200);

#pragma mark 下面的滚动视图
        subImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(subImageTapped:)];
        [subImageView addGestureRecognizer:tap];
        [_subScrollView addSubview:subImageView];
        i++;
    }
    [self.view addSubview:_subScrollView];
}

-(void)subImageTapped:(UITapGestureRecognizer *)tap{
    CGPoint point = [tap locationInView:_subScrollView];
    _currentIndex = point.x/150;
    
    
    //此时,如果只loadPageView的话,就会出现实际上是加载了图片,但是当前页面没有偏移,出现空白页面的情况
    //参见 UIScorollView_contentOffset.png
    _mainScrollView.contentOffset = CGPointMake(768*_currentIndex, 0);
    [self loadPageView];
}

#pragma mark 顶部按钮点击事件处理
-(void)buttonClicked:(UIButton *)button{
    NSLog(@"%s [LINE:%d] %i", __func__, __LINE__,button.tag);
}

#pragma mark ---绘制底部UI

-(void)showSubView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    if (_titleView.frame.origin.y == -44) {
        //出现
        [UIView animateWithDuration:0.5 animations:^{
            //
            _titleView.frame = CGRectMake(0, 0, 768, 44);
            _subScrollView.frame = CGRectMake(0, 1024-200, 768, 200);
        }];
    }
    else{
        //隐藏
        _titleView.frame = CGRectMake(0, -44, 768, 44);
        _subScrollView.frame = CGRectMake(0, 1024, 768, 200);
    }
}


#pragma mark ---绘制整体UI
-(void)layoutUI{

    // 1.主scrollView
    self.automaticallyAdjustsScrollViewInsets = NO;
    _mainScrollView = [[UIScrollView alloc]init];
    _mainScrollView.frame =self.view.bounds;
    _mainScrollView.delegate = self;
    _mainScrollView.pagingEnabled = YES;
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_mainScrollView];
    
    //book.xml 每页的背景图的名字
    //节点名,节点属性,节点的值.(节点属性是一个数组,节点的值也是一个节点,这个节点比较特殊,节点名位text,节点值就是文本)
    //2.读取book.xml文件 a)读取xml文件 b)读取文件root节点 c)匹配需要的节点 d)从节点中取出属性 e)从属性中取出值
    NSData *bookData = [[NSData alloc]initWithContentsOfFile:
                        [NSString stringWithFormat:@"%@/Library/Caches/book/book.xml",NSHomeDirectory()]];

    GDataXMLDocument *bookDocument = [[GDataXMLDocument alloc]initWithData:bookData options:0 error:nil];
    
    GDataXMLElement *rootElement = [bookDocument rootElement];
    
    NSArray *pageElements = [rootElement nodesForXPath:@"//page" error:nil];
    
    int i = 0;
    for (GDataXMLElement *pageElement in pageElements) {
        
        PageView *pv = [[PageView alloc]init];
        pv.frame = CGRectMake(768 *i , 0, 768, 1024);
        pv.pageViewId =  [[pageElement.attributes lastObject] stringValue];
        pv.pageViewIndex = i;
      //  [pv loadPage];//注意:先设置id,后加载背景图片.
        i++;
#if 0
//见上面的注释.
         NSArray *attArray = pageElement.attributes;
         GDataXMLElement *attNode = [attArray lastObject];
         NSString *attNodeValue = [attNode stringValue];
         NSString *attNodeName = [attNode name];
#endif
       
        
        [_pageViewArray addObject:pv];
        [_mainScrollView addSubview:pv];
    }
    
    //3.设置主ScorllView的内容大小
    _mainScrollView.contentSize = CGSizeMake(768*i, 1024);
    
    //模拟器的内存大小比真机的内存占用高20%~30%
}

#pragma mark --scrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x/768;
    if (_currentIndex != index)
    {
        _currentIndex = index;
        [self loadPageView];
    }
    _subScrollView.contentOffset = CGPointMake(150*_currentIndex, 0);
}

#pragma mark 加载页面

-(void)loadPageView{
    
    //0.释放部分
    //0.1得到所有应该加载的页的页号
    NSMutableArray *indexArray = [[NSMutableArray alloc]init];
    
    [indexArray addObject:[NSString stringWithFormat:@"%d",_currentIndex]];
    for (int i = 0 ; i < _maxPageNumber; i++) {
        if (_currentIndex - i - 1 >=0) {
             [indexArray addObject:[NSString stringWithFormat:@"%d",_currentIndex - i - 1]];
        }
        if (_currentIndex + i + 1 < [_pageViewArray count]) {
            [indexArray addObject:[NSString stringWithFormat:@"%d",_currentIndex + i + 1]];
        }
    }
    NSLog(@"indexArray=%@",indexArray);
    
    //遍历所有已经加载过的pageView对象
    
    for ( int i = 0; i < [_loadPaegViewArray count]; i++)
    {
        PageView *pv = [_loadPaegViewArray objectAtIndex:i];
        BOOL isRelease = YES;
        for (NSString *index in indexArray) {
            if (pv.pageViewIndex  == [index intValue]) {
                //是需要加载的不能释放
                isRelease = NO;
                break;
            }
        }
        //释放重资源
        if (pv.isActivityPage) {
            [pv unActivityPage];
        }
        
        //经过双重的遍历之后,如果isRelease值依旧是YES;
        //说明pv对象不需要加载了,这个时候,我们释放这个pv对象.
        if (isRelease) {
            [pv unloadPage];
            //在快速枚举中,删除元素,程序崩溃
            [_loadPaegViewArray removeObject:pv];
            i--;
        }
    }

    //1. 加载
    
    // 1.1 加载当前页:轻资源+重资源==>已经加载页面加入数据====>牺牲一点内存,提高遍历效率
    
    PageView *currentPageView = [_pageViewArray objectAtIndex:_currentIndex];
    
    if(!currentPageView.isLoadPage)
    {
        [currentPageView loadPage];
        [_loadPaegViewArray addObject:currentPageView];
    }
    
    [currentPageView activityPage];
    
    // 1.2加载左右各两页
    // 如果没有被加载,则加载,否则不加载.
    for (int i = 0; i < _maxPageNumber; i++)
    {

        if (_currentIndex - i -1 >= 0) {        //加载左侧页
            PageView *prePageView = [_pageViewArray objectAtIndex:_currentIndex - i- 1];
            if (!prePageView.isLoadPage) {
                [prePageView loadPage];
                 [_loadPaegViewArray addObject:prePageView];
            }
        }
        if (_currentIndex + i + 1 < [_pageViewArray count]) {//加载右侧页
            PageView *nextPageView = [_pageViewArray objectAtIndex:_currentIndex + i +1];
            if (!nextPageView.isLoadPage) {
                [nextPageView loadPage];
                [_loadPaegViewArray addObject:nextPageView];
            }
        }
    }
    NSLog(@"_loadPaegViewArray count =%d",[_loadPaegViewArray count]);
}

-(void)zipFile
{
    
    //1.判断是否已经解压缩过
    NSString *bookPath = [NSString stringWithFormat:@"%@/Library/Caches/book",NSHomeDirectory()];
    
    NSLog(@"%s [LINE:%d]%@", __func__, __LINE__,bookPath);
    
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    
    if (![fileManager fileExistsAtPath:bookPath])
    {
        //2.如果文件不存在,则去解压缩文件
        
        //2.1判断是否可以解压缩文件
        ZipArchive *zip  = [[ZipArchive alloc]init];
        
        NSString *appBookPath = [NSString stringWithFormat:@"%@/book.zip",[[NSBundle mainBundle]resourcePath]];
        
        if ([zip UnzipOpenFile:appBookPath])
        {
           //2.2解压缩文件
            [zip UnzipFileTo:[NSString stringWithFormat:@"%@/Library/Caches/",NSHomeDirectory()] overWrite:YES];
        }
    }

}


@end
