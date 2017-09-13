//
//  LoginModel.m
//  wistravel
//
//  Created by 刘智民 on 4/14/17.
//  Copyright © 2017 刘智民. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

- (id) init {
    if (self = [super init]) {
        self.shouldAutoLogin = [[theDefault objectForKey:lastLoginSuccess] boolValue];
        if (self.shouldAutoLogin) {
            self.phoneNumber = [theDefault objectForKey:lastLoginPhoneNumber];
            self.password = [theDefault objectForKey:lastLoginPwd];
            self.tocken = [theDefault objectForKey:lastLoginTocken];
        } else {
            self.phoneNumber = nil;
            self.password = nil;
            self.tocken = nil;
        }
    }
    return self;
}

@end
