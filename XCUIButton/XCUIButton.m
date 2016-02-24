//
//  XCUIButton.m
//  Transfer
//
//  Created by 刘智民 on 27/11/2015.
//  Copyright © 2015 ChuanXin. All rights reserved.
//

#import "XCUIButton.h"
#import<POP.h>

@interface XCUIButton ()
{
}
@end

@implementation XCUIButton
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self buttonSizeLarge];
    [super touchesBegan:touches withEvent:event];
    WLLog(@"touch begin");
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self resetButtonsize];
    [super touchesCancelled:touches withEvent:event];
    WLLog(@"touch cancel");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self resetButtonsize];
    [super touchesEnded:touches withEvent:event];
    WLLog(@"touch end");
}

- (void)buttonSizeLarge {
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.2 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2f, 1.2f);
        if (self.superview.tag == kXCUIBottonBkimgtag && [self.superview.class isSubclassOfClass:[UIImageView class]]) {
            self.superview.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2f, 1.2f);
        }
    } completion:nil];
}

- (void)resetButtonsize {    [UIView animateWithDuration:0.4 delay:0.2 usingSpringWithDamping:0.4 initialSpringVelocity:0.5 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.transform = CGAffineTransformIdentity;
        if (self.superview.tag == kXCUIBottonBkimgtag && [self.superview.class isSubclassOfClass:[UIImageView class]]) {
            self.superview.transform = CGAffineTransformIdentity;
        }
    } completion:nil];
}
@end
