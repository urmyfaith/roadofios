
复用机制就是屏幕上最多显示同标签cell有多少个我们就会实例化多少个cell.

当cell视图偏移出talbeView的frame时,

cell会被放入cell复用池中等待被复用.

当有新一行出现时,从复用池中取出cell复用.

用cell复用的时注意:

1. 不同标签cell不能复用.
2. 被复用的cell有之前保存的值,需要清空.
3. 每个tableview的cell复用池是独立的.
即使屏幕上同事出现多个tablew他们之前也不会复用cell.