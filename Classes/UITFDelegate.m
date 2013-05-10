#import <UIKit/UIApplication.h>
#import "UITFDelegate.h"

@interface UIApplication (CategoryWarningPreventer)
- (void)setApplicationBadgeString:(id)string;
@end

@implementation UITFDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
NSLog(@"textFieldShouldBeginEditing:");
	return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
NSLog(@"textFieldDidBeginEditing:");
	return;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
NSLog(@"textFieldShouldEndEditing:");
	return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
NSLog(@"textFieldDidEndEditing:");
	[[UIApplication sharedApplication] setApplicationBadgeString:[textField text]];
//	abort();
	return;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
NSLog(@"textField:shouldChangeCharactersInRange:replacementString:");
	return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
NSLog(@"textFieldShouldClear:");
	return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
NSLog(@"textFieldShouldReturn:");
	[textField resignFirstResponder];
	return YES;
}

@end
