//
//  XCUIButton.h
//  Transfer
//
//  Created by 刘智民 on 27/11/2015.
//  Copyright © 2015 ChuanXin. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface XCUIButton : UIButton
- (void)resetButtonsize;
/**
 *  放大水平的倍数
 */
@property (nonatomic,assign)CGFloat popW;
/**
 *  放大的垂直倍数
 */
@property (nonatomic,assign)CGFloat popH;
@end
