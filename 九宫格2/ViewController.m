//
//  ViewController.m
//  九宫格2
//
//  Created by piglikeyoung on 15/2/22.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "ViewController.h"
#import "JHAppInfo.h"
#import "JHAppInfoView.h"

@interface ViewController ()<JHAppInfoViewDelegate>
@property (nonatomic, strong) NSArray *appList;
@end

@implementation ViewController
// 思路为帅，代码为兵！
- (NSArray *)appList
{
    if (!_appList) {
        // 1. 从mainBundle加载
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle pathForResource:@"app.plist" ofType:nil];
        //        _appList = [NSArray arrayWithContentsOfFile:path];
        
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        // 将数组转换成模型，意味着self.appList中存储的是JHAppInfo对象
        // 1. 遍历数组，将数组中的字典依次转换成AppInfo对象，添加到一个临时数组
        // 2. self.appList = 临时数组
        NSMutableArray *arrayM = [NSMutableArray array];
        
        for (NSDictionary *dict in array) {
            
            [arrayM addObject:[JHAppInfo appInfoWithDict:dict]];
        }
        
        _appList = arrayM;
    }
    return _appList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 总共有3列
    int totalCol = 3;
    CGFloat viewW = 80;
    CGFloat viewH = 90;
    
    CGFloat marginX = (self.view.bounds.size.width - totalCol * viewW) / (totalCol + 1);
    CGFloat marginY = 10;
    CGFloat startY = 20;
    
    for (int i = 0; i < self.appList.count; i++) {
        // 行数
        // i = 0, 1, 2  / 3 = 0
        // i = 3, 4, 5  / 3 = 1
        int row = i / totalCol;
        // 列数
        // i = 0, 3, 6 col 0
        // i = 1, 4, 7 col 1
        // i = 2, 5, 8 col 2
        int col = i % totalCol;
        
        CGFloat x = marginX + (viewW + marginX) * col;
        CGFloat y = startY + marginY + (viewH + marginY) * row;
        
        JHAppinfoView *appView = [JHAppinfoView appInfoViewWithAppInfo:self.appList[i]];
        
        appView.delegate = self;//注册代理对象
        
        appView.frame = CGRectMake(x, y, viewW, viewH);
        
        [self.view addSubview:appView];
        
    }
}

- (void)appInfoViewDownLoad:(JHAppinfoView *)appInfoView{
    
        // 实例化一个UILabel显示在视图上，提示用户下载完成
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 400, 160, 40)];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor lightGrayColor];
    
        JHAppInfo *appInfo = appInfoView.appInfo;
        label.text = [NSString stringWithFormat:@"下载%@完成",appInfo.name];
        label.font = [UIFont systemFontOfSize:13.0];
        label.alpha = 1.0;
    
        // self.surperview就是viewController的view
        [self.view addSubview:label];
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

