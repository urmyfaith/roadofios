
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
-


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
