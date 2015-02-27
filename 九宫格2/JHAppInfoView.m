//
//  JHAppInfoView.m
//  九宫格2
//
//  Created by piglikeyoung on 15/2/23.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHAppInfoView.h"
#import "JHAppInfo.h"

@interface JHAppinfoView ()
    
    @property (weak, nonatomic) IBOutlet UIImageView *iconImage;
    @property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation JHAppinfoView

+ (instancetype)appInfoView{
    // loadNibNamed会将名为 appInfoView 中定义的所有视图全部加载出来，并且按照XIB中定义的顺序，返回一个视图的数组
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"appInfoView" owner:nil options:nil];
    return [array firstObject];
}

+ (instancetype) appInfoViewWithAppInfo:(JHAppInfo *)appInfo{
    
    JHAppinfoView *view = [self appInfoView];
    view.appInfo = appInfo;
    return view;
}

- (void)setAppInfo:(JHAppInfo *)appInfo{
    
    // 在setter方法中千万不要忘记用成员变量记录参数
    _appInfo = appInfo;
    
    self.iconImage.image = appInfo.image;
    self.nameLabel.text = appInfo.name;
}


- (IBAction)downloadClick:(UIButton *)sender {
    
    // 3.让代理去办事
    if ([self.delegate respondsToSelector:@selector(appInfoViewDownLoad:)]) {
        [self.delegate appInfoViewDownLoad:self];
    }

}

@end
