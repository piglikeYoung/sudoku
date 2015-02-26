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
    @property (nonatomic,strong) JHAppInfo *appInfo;

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
    
    // 实例化一个UILabel显示在视图上，提示用户下载完成
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 400, 160, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor lightGrayColor];
    
    JHAppInfo *appInfo = self.appInfo;
    label.text = [NSString stringWithFormat:@"下载%@完成",appInfo.name];
    label.font = [UIFont systemFontOfSize:13.0];
    label.alpha = 1.0;
    
    // self.surperview就是viewController的view
    [self.superview addSubview:label];
    // 动画效果
    // 动画效果完成之后，将Label从视图中删除
    // 首尾式动画，只能做动画，要处理完成后的操作不方便
    //    [UIView beginAnimations:nil context:nil];
    //    [UIView setAnimationDuration:1.0];
    //    label.alpha = 1.0;
    //    [UIView commitAnimations];
    
    
    // block动画比首尾式动画简单，而且能够控制动画结束后的操作
    // 在iOS中，基本都使用首尾式动画
    [UIView animateWithDuration:2.0 animations:^{
        label.alpha = 0.0;
    } completion:^(BOOL finished) {
        // 删除label
        [label removeFromSuperview];
    }];

}

@end
