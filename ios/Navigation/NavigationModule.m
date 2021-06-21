
#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"


@interface RCT_EXTERN_MODULE(Navigation, NSObject)
RCT_EXTERN_METHOD(navigateTo: (NSString)destination)
RCT_EXTERN_METHOD(goBack)
RCT_EXTERN_METHOD(MRZBack)
@end
