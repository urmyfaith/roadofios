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
}

-(void)layoutUI{

    // 1.主scrollView
    _mainScrollView = [[UIScrollView alloc]init];
    _mainScrollView.frame =self.view.bounds;
    _mainScrollView.delegate = self;
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
        [pv loadPage];//注意:先设置id,后加载背景图片.
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
    _mainScrollView.contentSize = CGSizeMake(768*(i+1), 1024);
    
    //模拟器的内存大小比真机的内存占用高20%~30%
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
