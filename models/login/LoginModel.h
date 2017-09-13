//
//  LoginModel.h
//  wistravel
//
//  Created by 刘智民 on 4/14/17.
//  Copyright © 2017 刘智民. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject

/**
 the user's phoneNumber for logining
 */
@property (nonatomic,strong) NSString *phoneNumber;

/**
 the user's password for logining
 */
@property (nonatomic,strong) NSString *password;

/**
 login without pwd
 */
@property (nonatomic,strong)NSString *tocken;

/**
  user logined success from last time the value and without any logout before app killed,this value will be YES
 */
@property (nonatomic,assign) BOOL shouldAutoLogin;
@end
