//
//  XCUIButton.m
//  Transfer
//
//  Created by 刘智民 on 27/11/2015.
//  Copyright © 2015 ChuanXin. All rights reserved.
//

#import "XCUIButton.h"

@interface XCUIButton ()
{
}
@end

@implementation XCUIButton
@synthesize popW;
@synthesize popH;

- (id)init {
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (void) initialize {
    popW = popH = 0.9;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self buttonSizeLarge];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self resetButtonsize];
    [super touchesCancelled:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self resetButtonsize];
    [super touchesEnded:touches withEvent:event];
}

- (void)buttonSizeLarge {
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.2 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, popW, popH);
    } completion:nil];
}

- (void)resetButtonsize {    [UIView animateWithDuration:0.4 delay:0.2 usingSpringWithDamping:0.4 initialSpringVelocity:0.5 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState animations:^{
    self.transform = CGAffineTransformIdentity;
} completion:nil];
}
@end
