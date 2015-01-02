//
//  ViewController.m
//  1231_simple_weibo
//
//  Created by zx on 12/31/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ViewController.h"
#import "ZXHttpRequest.h"
#import "GDataXMLNode.h"
#import "ZXTweetModel.h"
#import "ZXTweetCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)    NSMutableArray    *datas;
@property (nonatomic,strong)     ZXHttpRequest *httpRequest;
@property (nonatomic,strong)    UITableView    *tableView;
@end

/*
 获取数据
 从数据库获取
 从本地文件获取
 从网络获取数据
 假数据
 解析数据
 json
 xml
 表示数据
 将数据放入数据模型,再放入数组
 展示数据
 通过tableView显示数据
 自定义cell
 */
@implementation ViewController
-(NSMutableArray *)datas{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   //-------1
    [self downLoadData];
    //------2
    [self loadUI];
}

-(void)loadUI{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%s [LINE:%d] section = %i", __func__, __LINE__,section);
    return [self.datas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    ZXTweetCell *cell = [ZXTweetCell cellWithTableView:tableView];
    
    cell.myModel =self.datas[indexPath.row];
    NSLog(@"%s [LINE:%d]row=%i,imgSmall=%@", __func__, __LINE__,indexPath.row, cell.myModel.imgSmall);

    return cell;
}



//自定义cell的高度:固定高度+自适应的文字高度的总和
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXTweetModel *model = self.datas[indexPath.row];
    NSLog(@"%s [LINE:%d] row = %i", __func__, __LINE__,indexPath.row);
    CGFloat contentH = [self conentHeightWithSize:12.0 width:200.0 stirng:model.body];
    CGFloat smallH = 0;
    if (![model.imgSmall isEqualToString:@""]) {
        smallH = 50;
    }
    else{
        smallH = 0;
    }
    return 10+30+10+30+10+contentH+smallH;
}

//得到内容的自适应高度.
-(CGFloat)conentHeightWithSize:(CGFloat)size
                        width:(CGFloat)width
                       stirng:(NSString *)string{
    /*
     第一个参数:自适应的尺寸
     第二个参数:布局格式 
     第三个参数:文字的属性列表
     第四个参数:上下文
     */
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]} context:nil];
    return rect.size.height;
}



#pragma mark downloadData
-(void)downLoadData{
    
    NSString *path = @"http://www.oschina.net/action/api/tweet_list?uid=273804&pageIndex=0&pageSize=30";
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    self.httpRequest = [[ZXHttpRequest alloc]initWithRequest:request andBlock:^(ZXHttpRequest *request) {
        //
        NSString *string = [[NSString alloc]initWithData:request.downloadData encoding:NSUTF8StringEncoding];
        //NSLog(@"%s [LINE:%d] string=%@", __func__, __LINE__,string);
        
        GDataXMLDocument *doc = [[GDataXMLDocument alloc]initWithData:request.downloadData options:0 error:nil];

        NSArray *array = [doc nodesForXPath:@"//tweet" error:nil];
        //NSLog(@"%s [LINE:%d],array=%@", __func__, __LINE__,array);
        
        for (GDataXMLElement *element in array) {
            
            #if 0
            GDataXMLElement *element_id= [[element elementsForName:@"id"] firstObject];
            NSString *str_id = [element_id stringValue];
            NSLog(@"%s [LINE:%d] str_id=%@", __func__, __LINE__,str_id);
            #endif
            ZXTweetModel *model = [ZXTweetModel modelWithElement:element];
          //  NSLog(@"%s [LINE:%d] model=%@", __func__, __LINE__,model);
            [self.datas addObject:model];
        }
         [self.tableView reloadData];
    }];
   
}

@end
