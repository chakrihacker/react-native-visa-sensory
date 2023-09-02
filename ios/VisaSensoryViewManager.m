#import <React/RCTViewManager.h>

@interface RCT_EXTERN_REMAP_MODULE(VisaSensory, VisaSensoryViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(color, NSString)
RCT_EXTERN_METHOD(startAnimation
                  : (nonnull NSNumber*)node nodeHandle)

@end
	
