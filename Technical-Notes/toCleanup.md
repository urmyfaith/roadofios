如何对已经施加了rotation和translate的view,计算view上的四个角点
2015年1月31日 11:59
我们在一个view控件应用各种transform之后，怎么计算这个view的四个角点，难道你还傻傻的计算它的角度，然后用该死的sin，cos，tan数学函数计算嘛，别傻了，如果是学渣（譬如我）这样你会算几天的。
分享个方法，让你快速算出四个点，什么角度和平移统统扔一边
//得到原来的中心点
 CGPoint originalCenter = CGPointApplyAffineTransform(View.center,
                          CGAffineTransformInvert(_styleLeftEyeView.transform));
譬如得到右上角的顶点
    CGPoint topRight = originalCenter;
    topRight.x += view.bounds.size.width / 2;
    topRight.y -= view.bounds.size.height / 2;
    topRight = CGPointApplyAffineTransform(topRight, view.transform);
    
    http://weibo.com/p/1001603805044494470392