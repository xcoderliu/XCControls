//
//  FunctionMacro.h
//
//  Created by XCoderLiu on 2/22/16.
//
//

#ifndef FunctionMacro_h
#define FunctionMacro_h

#import "FMCommonString.h"

//调试Log
#ifdef DEBUG
#define XCLog(s, ... )  NSLog( @"<%@ | line:%d | method:%s> Print: %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent],__LINE__, __FUNCTION__,[NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define XCLog(s, ... )
#endif

//Appdelegate
#define theApp ((AppDelegate*)[UIApplication sharedApplication].delegate)

//轻量数据存储
#define theDefault ([NSUserDefaults standardUserDefaults])

//本地化
#define Localstring(s) ([FMCommonString getCommonStringByKey:s])

//屏幕长宽
#define kScreenWidth ([UIScreen mainScreen].applicationFrame.size.width)

#define kScreenHeight ([UIScreen mainScreen].applicationFrame.size.height)

// 颜色定义
#define RGBColor(r, g, b) ([UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0])

// 字体
#define Font(s) ([UIFont systemFontOfSize:s])
#define BFont(s) ([UIFont boldSystemFontOfSize:s])

// 是否为4inch
#define fourInch ([UIScreen mainScreen].applicationFrame.size.height == 568)

// 是否3.5inch
#define threeInch ([UIScreen mainScreen].applicationFrame.size.height == 480)

//safe release

#define SAFE_DELETE(p) do { if(p){ delete p; p=NULL;} } while(false)

#define SAFE_FREE(p) do { if(p){ free(p); p=NULL;} } while (false)

#define SAFE_RELEASE(p) do { if(p) {;p=nil; } } while (false)

//是否iPhone
#define TARGET_IPHONE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

#endif /* FunctionMacro_h */
