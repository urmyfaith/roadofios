~~~objectivec
*** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[__NSCFNumber length]: unrecognized selector sent to instance 0x8f0e9f0'
*** First throw call stack:
(
	0   CoreFoundation                      0x01b781e4 __exceptionPreprocess + 180
	1   libobjc.A.dylib                     0x016c58e5 objc_exception_throw + 44
	2   CoreFoundation                      0x01c15243 -[NSObject(NSObject) doesNotRecognizeSelector:] + 275
	3   CoreFoundation                      0x01b6850b ___forwarding___ + 1019
	4   CoreFoundation                      0x01b680ee _CF_forwarding_prep_0 + 14
	5   UIKit                               0x00542463 -[UILabel _shadow] + 45
	6   UIKit                               0x005438c2 -[UILabel drawTextInRect:] + 70
	7   UIKit                               0x00545dfc -[UILabel drawRect:] + 98
	8   UIKit                               0x003f4453 -[UIView(CALayerDelegate) drawLayer:inContext:] + 504
	9   QuartzCore                          0x019def39 -[CALayer drawInContext:] + 123
	10  QuartzCore                          0x019dee6a _ZL16backing_callbackP9CGContextPv + 96
	11  QuartzCore                          0x018cd4fc CABackingStoreUpdate_ + 2656
	12  QuartzCore                          0x019dee02 ___ZN2CA5Layer8display_Ev_block_invoke + 93
	13  QuartzCore                          0x01a132d7 x_blame_allocations + 15
	14  QuartzCore                          0x019dec6d _ZN2CA5Layer8display_Ev + 1519
	15  QuartzCore                          0x019deeb9 -[CALayer _display] + 33
	16  QuartzCore                          0x019de676 _ZN2CA5Layer7displayEv + 144
	17  QuartzCore                          0x019dee93 -[CALayer display] + 33
	18  QuartzCore                          0x019d3043 _ZN2CA5Layer17display_if_neededEPNS_11TransactionE + 323
	19  QuartzCore                          0x019d30bc _ZN2CA5Layer28layout_and_display_if_neededEPNS_11TransactionE + 38
	20  QuartzCore                          0x019397fa _ZN2CA7Context18commit_transactionEPNS_11TransactionE + 294
	21  QuartzCore                          0x0193ab85 _ZN2CA11Transaction6commitEv + 393
	22  QuartzCore                          0x0193b258 _ZN2CA11Transaction17observer_callbackEP19__CFRunLoopObservermPv + 92
	23  CoreFoundation                      0x01b4036e __CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__ + 30
	24  CoreFoundation                      0x01b402bf __CFRunLoopDoObservers + 399
	25  CoreFoundation                      0x01b1e254 __CFRunLoopRun + 1076
	26  CoreFoundation                      0x01b1d9d3 CFRunLoopRunSpecific + 467
	27  CoreFoundation                      0x01b1d7eb CFRunLoopRunInMode + 123
	28  GraphicsServices                    0x03be95ee GSEventRunModal + 192
	29  GraphicsServices                    0x03be942b GSEventRun + 104
	30  UIKit                               0x00385f9b UIApplicationMain + 1225
	31  xCarDemo                            0x0003790d main + 141
	32  libdyld.dylib                       0x020c06d9 start + 1
)
libc++abi.dylib: terminating with uncaught exception of type NSException
(lldb) 
~~~