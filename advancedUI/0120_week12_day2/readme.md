
七层模型

tcp/ip===>网络通信协议

单说,tcp传输控制协议,ip因特网互联协议

tpc/ip===>四层协议

tcp/ip编程 成作为 socket编程

tcp 短链接协议,http应用层协议,长链接


- ASsyncSocket
- CFNetwork
- BSD Scocket

### TCP

面向链接的,可靠的,基于字节流的传输层协议.

ip层提供不可靠的包交换.
 
- 面向链接
- 端到端
- 高可靠性
- 双工
- 长连接
- 三次握手
- 有序,可靠,稳定的数据通讯管道

### UDP

- 用户数据报协议
- 传输层协议
- 无面向连接
- 由于不面向连接,所以传输数据块,会有丢包后者乱序的情况
- 广播,组播

### IP

ip协议,为每一台接入互联网的设备分配ip地址.

DNS 域名解析   域名===>ip地址

DHCP

ios事件路由机制

事件向下穿透,值到某一个view可以拦截这个事件.


##  服务器端和客户端的通信


#### 客户端

- 1)创建socket对象,(在创建对象的时候,把代理设置为自己)
- 2)设置需要连接到服务器的ip&port后,发送 连接消息.
- 3)自动回调
- `-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port`
- 4)通过管道给服务器发送给数据
- 5)自动回调
- `-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag`
- 6)通过管道读取服务器的响应消息
- 7)自动回调
- `- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag`


可以看到,整个客户端,就三个功能,用表的形式反映出来:

| 类别 | 回调方法| 说明|
| :-------------: | :------------: |:------:|
| 连接服务器 | -onSocket:didConnectToHost:port:| 连接成功时执行|
| 向管道发送数据 | -onSocket:didWriteDataWithTag:| 发送数据成功时执行|
| 从管道获取数据  | -onSocket:didReadData:withTag: |从管道读取到数据时执行|

~

**对应的工程文件**`advancedUI/0120_week12_day2/TCPClientV2/TCPClient/ZXMainViewController.m`

第一步:创建sockect对象(第三方库进行过一次封装的socket)

~~~objectivec
_clientSocket = [[AsyncSocket alloc]initWithDelegate:self];
~~~

第二步A: 连接服务器(指定ip&port)

~~~objectivec
  NSString *host = @"192.168.2.2";
  [_clientSocket connectToHost:host onPort:5678 error:nil];
~~~

第二步B:连接成功的回调方法:

~~~objectivec

/**
 *  当我们连接到服务器使调用此方法
 *
 *  @param sock 服务器的sock(包含了端口号和地址)/_clientSocket
 *  @param host 服务器地址
 *  @param port 服务器的端口
 */
-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port{
    NSLog(@" 链接到服务器成功");
    NSLog(@"host-%@",host);
    NSLog(@"port-%d",port);
    NSLog(@"sock.connectedHost-%@",sock.connectedHost);
    NSLog(@"sock.connectedPort-%d",sock.connectedPort);
    
    NSLog(@"_clientSocket - %p",_clientSocket);
    NSLog(@"sock - %p",sock);
    [_clientSocket readDataWithTimeout:-1 tag:100];
}
~~~


第三步A:向服务器发送信息:(实际上数据写入管道)

UI==>属性/成员变量==>字典===>xml==>NSdata

~~~objectivec
  [_clientSocket writeData:data withTimeout:-1 tag:1];
~~~

第三步B:向服务器发送信息成功的回调函数

~~~objectivec
//当发送数据成功的时候调用.
-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag{
    NSLog(@"数据发送成功-%ld",tag);
    NSLog(@"_clientSocket - %p",_clientSocket);
    NSLog(@"sock - %p",sock);
}
~~~


第四步A:从服务器获取数据(实际上从管道获取数据)

~~~objectivec
 [_clientSocket readDataWithTimeout:-1 tag:100];
~~~

第四步B:读取到数据的回调方法

~~~objectivec
- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"string=%@",string );   
    [sock readDataWithTimeout:-1 tag:100];
}
~~~


--todohere 插入图片 SocketClientSide_code.jpg

## 服务端

由于同一通信协议层次上的设备的对等性.服务端和客户端的相似,也体现了管道的双向性.

-  1)创建socket套接字,实例化对象
-  2)指定端口号,监听端口
-  3)回到函数:有新连接时执行
-  `-(void)onSocket:(AsyncSocket *)sock didAcceptNewSocket:(AsyncSocket *)newSocket`(处理:保存管道,读取数据...)
- 4)从管道读取数据
- 5)回调函数:读取到数据使执行
- `-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag`
- 6)向管道写入数据
- 7)回调函数:写入数据成功后执行
- ``
- 8)连接将要断开,连接已经断开.


第一步:创建服务端socket对象,实例化,

~~~objectivec
    _serverSocket = [[AsyncSocket alloc]initWithDelegate:self];
~~~

第二步A:监听指定的端口号


~~~objectivec
    [_serverSocket acceptOnPort:5678 error:nil];
    NSLog(@"监听端口---等待客户端链接");
~~~

第二步B:回调方法:**有客户端加入,已经建立了连接**

(需要保存通讯管道),(刷新UI),(读取消息)

~~~objectivec
-(void)onSocket:(AsyncSocket *)sock didAcceptNewSocket:(AsyncSocket *)newSocket{
    
    NSLog(@"有新客户端加入");
    [_socketArray addObject:newSocket];//加入数组
    
    [_tableView reloadData];
    
    [newSocket readDataWithTimeout:-1 tag:0];//接受消息
}
~~~

第三步A:从管道接收数据

~~~objectivec
[newSocket readDataWithTimeout:-1 tag:0];//接受消息
~~~

第三步B:回掉方法

~~~objectivec
-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    
    NSLog(@"接受到数据");
    
    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"recevied data string:%@",string);
~~~

第四步A:向管道写入数据(给客户端发消息,响应)

~~~objectivec
   [sock writeData:data withTimeout:-1 tag:0 ];
~~~

第四步B,回调方法

~~~objectivec
-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag{
    NSLog(@"数据发送成功-%ld",tag);
}
~~~

第五步:将要断开连接,已经断开连接

(需要将管道从数组中移除)

~~~objectivec
-(void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err{
    NSLog(@"将要断开链接");
}

-(void)onSocketDidDisconnect:(AsyncSocket *)sock{
   NSLog(@"已经断开连接");
    
    //从数组中移除已经断开的连接对象.
    [_socketArray removeObject:sock];
}
~~~


#### 数据的转换问题

客户端: UI ==> 成员变量/属性==>字典===>xml===>NSData(发送出去)

服务器: NSData===>xml===>字典====>成员变量/属性===>UI(接收数据)

不管是哪一侧,发数据和读取数据都是一样的过程.


> 问题的关键点在于,字典和xml的相互换换问题.(xml与NSData的转换,第三方库已经封装)



1.) 字典===>xml的转换过程思路

a)遍历字典
b)如果vaue是字符串,直接创建节点
c)将节点加入xml文档
d)如果value是字典,goto  a)

2.) xml ===> 字典的转换思路

a)遍历root/当前节点的子节点
b)如果是值节点,根据这个节点的名称(key)和节点的值(value)做字典
c)如果不是,goto a)











