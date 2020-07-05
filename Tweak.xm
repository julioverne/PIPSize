

// allow any size
%hook SBPIPContainerViewController
-(CGSize)_constrainContentViewSize:(CGSize)arg1
{
	return arg1;
}
%end

@interface SBPIPWindow : UIWindow
- (void)_setSecure:(BOOL)arg1;
- (void)makeVisible; //new
@end

static BOOL tmpDisable;

%hook SBPIPWindow
%new
- (void)makeVisible
{
	if(tmpDisable) {
		return;
	}
	tmpDisable = YES;
	self.hidden = NO;
	self.alpha = 1.0f;
	self.windowLevel = 9999;
	[self _setSecure:YES];
	tmpDisable = NO;
}
- (void)setHidden:(BOOL)arg1
{
	%orig;
	[self makeVisible];
}
- (void)setAlpha:(float)arg1
{
	%orig;
	[self makeVisible];
}
-(void)setRootViewController:(id)arg1
{
	%orig;
	[self makeVisible];
}
%end