#浅拷贝和深拷贝

工程地址

`roadofios/projects/1206_week5_day6/Deep_Shallow_Copy/Deep_Shallow_Copy/main.m`

- **浅拷贝的方法**

~~~objectivec
NSArray *shallowCopyArray = [someArray copyWithZone:nil];
 
NSDictionary *shallowCopyDict = [[NSDictionary alloc] initWithDictionary:someDictionary copyItems:NO]
~~~

- **一层深拷贝**(有争议,见参考资料2)

~~~objectivec
If you only need a one-level-deep copy, you can explicitly call for one:

NSMutableArray *newArray = [[NSMutableArray alloc] initWithArray:oldArray copyItems:YES];
~~~

- **一个真正意义上的拷贝**(很笨重,效率低,都不推荐使用,但是苹果这么建议?见参考资料3)


>Deep Copies

	There are two ways to make deep copies of a collection. You can use the collection’s equivalent of initWithArray:copyItems: with YES as the second parameter. If you create a deep copy of a collection in this way, each object in the collection is sent a copyWithZone: message. If the objects in the collection have adopted the NSCopying protocol, the objects are deeply copied to the new collection, which is then the sole owner of the copied objects. If the objects do not adopt the NSCopying protocol, attempting to copy them in such a way results in a runtime error. However, copyWithZone: produces a shallow copy. This kind of copy is only capable of producing a one-level-deep copy. If you only need a one-level-deep copy, you can explicitly call for one as in Listing 2.

	Listing 2  Making a deep copy

~~~objectivec
NSArray *deepCopyArray=[[NSArray alloc] initWithArray:someArray copyItems:YES];
~~~


	This technique applies to the other collections as well. Use the collection’s equivalent of initWithArray:copyItems: with YES as the second parameter.

	If you need a true deep copy, such as when you have an array of arrays, you can archive and then unarchive the collection, provided the contents all conform to the NSCoding protocol. An example of this technique is shown in Listing 3.

	Listing 3  A true deep copy

~~~objectivec
NSArray* trueDeepCopyArray = [NSKeyedUnarchiver unarchiveObjectWithData:
          [NSKeyedArchiver archivedDataWithRootObject:oldArray]];
~~~



- **一句话总结:**(文字见参考资料4,图片见参考资料6)

~~~objectivec
	In short,
 	it depends on what points to what.
 	In a shallow copy, object B points to object A's location in memory. 
	In deep copy, all things in object A's memory location get copied to object B's memory location.
	
	浅拷贝,B对象指向A对象的内存
	深拷贝,将A对象的内存里全部赋值一份到B对象.
~~~


## 参考资料

- 1. http://stackoverflow.com/questions/9912794/deep-copy-and-shallow-copy
- 2. http://stackoverflow.com/questions/647260/deep-copying-an-nsarray/647269#647269
- 3. https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Collections/Articles/Copying.html#//apple_ref/doc/uid/TP40010162-SW3
- 4. http://stackoverflow.com/questions/184710/what-is-the-difference-between-a-deep-copy-and-a-shallow-copy
- 5. http://www.cnblogs.com/ludashi/p/3894151.html
- 6. http://en.wikipedia.org/wiki/Object_copy