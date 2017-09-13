//
//  LoginViewModel.m
//  wistravel
//
//  Created by 刘智民 on 4/14/17.
//  Copyright © 2017 刘智民. All rights reserved.
//

#import "LoginViewModel.h"
#import "LoginViewController.h"
#import <AFNetworking/AFNetworking.h>


@interface LoginViewModel ()
@property (nonatomic,strong) RACSignal *phoneSignal;
@property (nonatomic,strong) RACSignal *pwdSignal;
@end

@implementation LoginViewModel

- (id) init {
    if (self = [super init]) {
        self.model = [[LoginModel alloc] init];
        _phoneSignal = RACObserve(self.model, phoneNumber);
        _pwdSignal = RACObserve(self.model, password);
        self.signalSuccess = [RACSubject subject];
        self.signalFailure = [RACSubject subject];
        self.signalErrorFormat = [RACSubject subject];
    }
    return self;
}

- (void)Login {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:loginRequest parameters:@{@"phoneNo":self.model.phoneNumber,@"password":self.model.password} progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            if ([responseObject[@"result"] boolValue] && [responseObject[@"retCode"] isEqualToString:@"0000"]) {//登陆成功
                self.model.tocken = responseObject[@"data"][@"tocken"];
                [self.signalSuccess sendNext:nil];
            } else {
                [self.signalErrorFormat sendNext:responseObject[@"retMsg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)clearPhoneNumber {
    [self.model setPhoneNumber:@""];
}

//合并两个输入框信号，并返回按钮bool类型的值
- (id) shouldLogin {
    
    RACSignal *isValid = [RACSignal
                          combineLatest:@[_phoneSignal, _pwdSignal]
                          reduce:^id(NSString *phoneNumber, NSString *password){
                              NSLog(@"LoginviewModel: phoneNumber:%@,password:%@",phoneNumber,password);
                              return @(phoneNumber.length >= 3 && password.length >= 3);
                          }];
    return isValid;
}

@end
