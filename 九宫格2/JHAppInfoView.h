//
//  JHAppInfoView.h
//  九宫格2
//
//  Created by piglikeyoung on 15/2/23.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#ifndef ___2_JHAppInfoView_h
#define ___2_JHAppInfoView_h


#endif

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class JHAppInfo;
@class JHAppinfoView;

// 1.定义协议
@protocol JHAppInfoViewDelegate <NSObject>

// 代理要实现的方法
- (void) appInfoViewDownLoad:(JHAppinfoView *) appInfoView;

@end

@interface JHAppinfoView : UIView

// 2.声明代理变量
@property (weak,nonatomic) id<JHAppInfoViewDelegate> delegate;

@property (nonatomic,strong) JHAppInfo *appInfo;

+ (instancetype) appInfoViewWithAppInfo:(JHAppInfo *)appInfo;

@end
