#import <React/RCTViewManager.h>

@interface RCT_EXTERN_REMAP_MODULE(VisaSensory, VisaSensoryViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(checkmarkMode, NSString)
RCT_EXPORT_VIEW_PROPERTY(isHapticFeedbackEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(isSoundEnabled, BOOL)


RCT_EXTERN_METHOD(animate: (nonnull NSNumber*)node
                  resolve : (RCTPromiseResolveBlock) resolve
                  reject : (RCTPromiseRejectBlock) reject)

@end
	
