#import "AppDelegate.h"

@interface UIDevice (PrivateCategoryToAvoidWarnings)
- (void)setOrientation:(UIInterfaceOrientation)orientation;
@end

UIKIT_EXTERN NSString *appDelegateName(void) {
return @"AppDelegate";
}

@implementation AppDelegate

@synthesize rootViewController;

// Monitoring Application State Changes
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
// Available in iOS 3.0 and later.

	Class rootVCClass = NSClassFromString(rvcName());
	if (!rootVCClass) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
			message:[NSString stringWithFormat:@"No \n%@\n class in code", rvcName()]
			delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil]; [alert show]; [alert release];
		return NO;
	}

	id rootVC = [[[rootVCClass alloc] init] autorelease];

	if (!rootVC) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
			message:[NSString stringWithFormat:@"Unable to init %@\n class", rvcName()]
			delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil]; [alert show]; [alert release];
		return NO;
	}

	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootVC];
	[self setRootViewController:nav];

	UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[window setAutoresizesSubviews:YES];
	[window setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
	[window addSubview:self.rootViewController.view];
	[window makeKeyAndVisible];

	return YES;
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
// Available in iOS 2.0 and later.
}
- (void)applicationWillResignActive:(UIApplication *)application {
// Available in iOS 2.0 and later.
}
#if defined __IPHONE_4_0 && __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_4_0
- (void)applicationDidEnterBackground:(UIApplication *)application {
// Available in iOS 4.0 and later.
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
// Available in iOS 4.0 and later.
}
#endif
- (void)applicationWillTerminate:(UIApplication *)application {
// Available in iOS 2.0 and later.
	//Private API
	[[UIDevice currentDevice] setOrientation:UIInterfaceOrientationPortrait];
	[(UINavigationController *)[self rootViewController] popToRootViewControllerAnimated:NO];
	[self refreshDefaultPNG];
}
- (void)applicationDidFinishLaunching:(UIApplication *)application {
// Available in iOS 2.0 and later.
}

// Opening a URL Resource
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
// Available in iOS 2.0 and later.
	return NO;
}
#if defined __IPHONE_4_2 && __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_4_2
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
// Available in iOS 4.2 and later.
	return NO;
}
#endif

// Managing Status Bar Changes
- (void)application:(UIApplication *)application willChangeStatusBarOrientation:(UIInterfaceOrientation)newStatusBarOrientation duration:(NSTimeInterval)duration {
// Available in iOS 2.0 and later.
}
- (void)application:(UIApplication *)application didChangeStatusBarOrientation:(UIInterfaceOrientation)oldStatusBarOrientation {
// Available in iOS 2.0 and later.
}
- (void)application:(UIApplication *)application willChangeStatusBarFrame:(CGRect)newStatusBarFrame {
// Available in iOS 2.0 and later.
}
- (void)application:(UIApplication *)application didChangeStatusBarFrame:(CGRect)oldStatusBarFrame {
// Available in iOS 2.0 and later.
}
// Responding to System Notifications
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
// Available in iOS 2.0 and later.
}
- (void)applicationSignificantTimeChange:(UIApplication *)application {
// Available in iOS 2.0 and later.
}

// Handling Remote Notifications
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
// Available in iOS 3.0 and later.
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
// Available in iOS 3.0 and later.
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
// Available in iOS 3.0 and later.
}

// Handling Local Notifications
#if defined __IPHONE_4_0 && __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_4_0
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
// Available in iOS 4.0 and later.
}

// Responding to Content Protection Changes
- (void)applicationProtectedDataWillBecomeUnavailable:(UIApplication *)application {
// Available in iOS 4.0 and later.
}
- (void)applicationProtectedDataDidBecomeAvailable:(UIApplication *)application {
// Available in iOS 4.0 and later.
}
#endif

- (void)dealloc {
	[[self rootViewController] release];
	[self setRootViewController:nil];
	[super dealloc];
}

- (void)refreshDefaultPNG {
	UIImage *defaultImage = [self makeDefaultImage];
	if (defaultImage) {
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectoryPath = [paths objectAtIndex:0];
		NSString *pngPath = [documentsDirectoryPath stringByAppendingPathComponent:@"Default.png"];
		[UIImagePNGRepresentation(defaultImage) writeToFile:pngPath atomically:YES];
	}
}
- (UIImage *)makeDefaultImage {
	UIViewController *vc = self.rootViewController;
	UIGraphicsBeginImageContext(vc.view.bounds.size);
	[vc.view.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return viewImage;
}
@end
