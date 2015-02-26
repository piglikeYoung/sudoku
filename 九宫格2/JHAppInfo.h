//
//  JHAppInfo.h
//
//
//  Created by piglikeyoung on 15/2/22.
//  Copyright (c) 2015 jinheng. All rights reserved.
//

#ifndef ___2_JHAppInfo_h
#define ___2_JHAppInfo_h


#endif


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JHAppInfo : NSObject

// 应用程序名称
@property (nonatomic, copy) NSString *name;
// 应用程序图标名称
@property (nonatomic, copy) NSString *icon;
// 图像
// 定义属性时，会生成getter&setter方法，还会生成一个带下划线的成员变量
// 如果是readonly属性，只会生成getter方法，同时没有成员变量
@property (nonatomic, strong, readonly) UIImage *image;

// instancetype会让编译器检查实例化对象的准确类型
// instancetype只能用于返回类型，不能当做参数使用
- (instancetype)initWithDict:(NSDictionary *)dict;

/** 工厂方法 */
+ (instancetype)appInfoWithDict:(NSDictionary *)dict;
@end