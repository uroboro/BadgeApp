#import <Availability.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

UIKIT_EXTERN NSString *rvcName(void);

UIKIT_EXTERN NSString *appDelegateName(void);

@interface AppDelegate: NSObject <UIApplicationDelegate> {
	UIViewController *rootViewController;
}

@property (nonatomic, retain) UIViewController *rootViewController;

- (void)refreshDefaultPNG;
- (UIImage *)makeDefaultImage;

@end