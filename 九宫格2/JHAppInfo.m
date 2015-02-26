//
//  JHAppInfo.m
//  九宫格2
//
//  Created by piglikeyoung on 15/2/22.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHAppInfo.h"


@interface JHAppInfo (){
    
    UIImage *_imageABC;

}

@end

@implementation JHAppInfo

- (instancetype)initWithDict:(NSDictionary *)dict{

    self = [super init];
    if (self) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}

+ (instancetype)appInfoWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (UIImage *)image{
    if (!_imageABC) {
        _imageABC = [UIImage imageNamed:self.icon];
    }
    return _imageABC;
}

@end
