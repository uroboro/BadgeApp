#import "RVController.h"
#import "UITFDelegate.h"

@implementation RVController
@synthesize textfield=_textfield, uitfdel=_uitfdel;

- (void)loadView {
	[super loadView];
[self setTitle:@"Badger"];
	[self.view setBackgroundColor:[UIColor blueColor]];

	_uitfdel = [[UITFDelegate alloc] init];

	CGFloat x = 30, y = 30, dx = self.view.frame.size.width - 2 * x, dy = 30;

	_textfield = [[UITextField alloc] initWithFrame:CGRectMake(x, y, dx, dy)];
[_textfield setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
	[_textfield setBackgroundColor:[UIColor whiteColor]];
	[_textfield setBorderStyle:UITextBorderStyleLine];
	[_textfield setClearButtonMode:UITextFieldViewModeWhileEditing];
	[_textfield setPlaceholder:@"App badge"];
	[_textfield setDelegate:_uitfdel];
	[self.view addSubview:_textfield];
}

- (void)viewDidLoad {
[_textfield becomeFirstResponder];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)dealloc {
	[_uitfdel release];
	[_textfield setDelegate:nil];
	[_textfield release];
	[super dealloc];
}
@end

