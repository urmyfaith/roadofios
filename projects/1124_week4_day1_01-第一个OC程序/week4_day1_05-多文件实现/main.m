#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Car *c = [Car new];
        [c makeCall:"13342889334"];
    }
    return 0;
}
