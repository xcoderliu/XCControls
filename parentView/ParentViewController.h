//
//  ParentViewController.h
//  FSMeetingClient
//
//  Created by XCoderLiu on 2/24/16.
//
//

#import <UIKit/UIKit.h>
#import <Masonry.h>

@interface ParentViewController : UIViewController
/**
 *  @author 刘智民
 *
 *  设置状态栏是否隐藏
 */
@property (nonatomic,assign)BOOL shouldStatusbarHidden;
/**
 *  @author 刘智民
 *
 *  是否能够手势返回菜单
 */
@property (nonatomic,assign)BOOL popGestureEnabled;
/**
 *  @author 刘智民
 *
 *  导航栏是否应该隐藏
 */
@property (nonatomic,assign)BOOL shouldNavigationBarHidden;
/**
 *  @author 刘智民, 16-04-17 20:04:10
 *
 *  視圖支持的旋轉方向
 */
@property (nonatomic,assign)UIInterfaceOrientationMask orientations;
/**
 *  @author 刘智民, 16-04-23 21:04:36
 *
 *  狀態欄的類型
 */
@property (nonatomic,assign)UIStatusBarStyle statusBarStyle;
/**;
 *  @author 刘智民
 *
 *  显示临时提醒
 *
 *  @param lpszMessage 提醒文字
 */
- (void)messageBox:(NSString*) lpszMessage;
/**
 *  @author 刘智民
 *
 *  清除状态
 */
@end
