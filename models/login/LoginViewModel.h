//
//  LoginViewModel.h
//  wistravel
//
//  Created by 刘智民 on 4/14/17.
//  Copyright © 2017 刘智民. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "LoginModel.h"

@class LoginViewController;

@interface LoginViewModel : NSObject

/**
 the model of login data
 */
@property (nonatomic,strong) LoginModel* model;
// signal of success
@property (nonatomic, strong) RACSubject *signalSuccess;
// signal of failure
@property (nonatomic, strong) RACSubject *signalFailure;
// signal of errorinfomation
@property (nonatomic, strong) RACSubject *signalErrorFormat;
// is condition enough for login
- (id)shouldLogin;
/**
 login action
 */
- (void)Login;
/**
 clear the phoneNumber
 */
- (void)clearPhoneNumber;
@end
