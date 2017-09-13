//
//  ParentViewController.m
//  FSMeetingClient
//
//  Created by XCoderLiu on 2/24/16.
//
//

#import "ParentViewController.h"
#import "AppDelegate.h"

@interface ParentViewController ()<UIGestureRecognizerDelegate>

@end

@implementation ParentViewController
@synthesize popGestureEnabled;
@synthesize shouldStatusbarHidden;
@synthesize shouldNavigationBarHidden;
@synthesize orientations;
@synthesize statusBarStyle;
- (id)init {
    if (self = [super init])
    {
        shouldNavigationBarHidden = NO;
        shouldStatusbarHidden = NO;
        popGestureEnabled = YES;
        orientations = UIInterfaceOrientationMaskPortrait;
        statusBarStyle = UIStatusBarStyleLightContent;
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = popGestureEnabled;
    self.navigationController.navigationBar.hidden = shouldNavigationBarHidden;
    [self.navigationController setNavigationBarHidden:shouldNavigationBarHidden];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:Font(18)}];
}

- (void)setShouldStatusbarHidden:(BOOL)shouldStatusbarHidden {
    [self  setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return statusBarStyle;
}

- (BOOL)prefersStatusBarHidden {
    return shouldStatusbarHidden;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return orientations;
}

- (void)dealloc {
    XCLog(@"%@:delloc",[self.class description]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)messageBox:(NSString*) lpszMessage
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:lpszMessage message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alertVC addAction:ok];
    [self presentViewController:alertVC animated:YES completion:nil];
    SAFE_RELEASE(alertVC);
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([gestureRecognizer isEqual:self.navigationController.interactivePopGestureRecognizer]) {
        if ([self isEqual:self.navigationController.topViewController]) {
            [self.navigationController popViewControllerAnimated:YES];
        }
        return NO;
    }
    return YES;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
