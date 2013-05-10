#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *appDelegateName(void);

int main(int argc, char **argv) {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	int r = UIApplicationMain(argc, argv, nil, appDelegateName());
	[pool release];
	return r;
}
