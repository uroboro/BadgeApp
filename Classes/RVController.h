#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *rvcName(void) {
return @"RVController";
}

@interface RVController : UIViewController {
	UITextField *_textfield;
	id<UITextFieldDelegate> _uitfdel;
}
@property (nonatomic, retain) UITextField *textfield;
@property (nonatomic, retain) id<UITextFieldDelegate> uitfdel;

@end
