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

@interface ViewController ()
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
        
//        UIView *appView = [[UIView alloc] initWithFrame:CGRectMake(x, y, viewW, viewH)];
        // loadNibNamed会将名为 appInfoView 中定义的所有视图全部加载出来，并且按照XIB中定义的顺序，返回一个视图的数组
//        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"appInfoView" owner:nil options:nil];
//        JHAppinfoView *appView = [array firstObject];
        JHAppinfoView *appView = [JHAppinfoView appInfoViewWithAppInfo:self.appList[i]];
        
        appView.frame = CGRectMake(x, y, viewW, viewH);
        
        [self.view addSubview:appView];
        
        // 创建appView内部的细节
        // 0> 读取数组中的字典
//        NSDictionary *dict = self.appList[i];
//        JHAppInfo *appInfo = self.appList[i];
//        appView.appInfo = self.appList[i];
        
        // 1> UIImageView
//        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, viewW, 50)];
//        UIImageView *imageView = appView.subviews[0];
//        UIImageView *imageView = (UIImageView *) [appView viewWithTag:1];
//        imageView.image = appInfo.image;
//        appView.iconImage.image = appInfo.image;
        
        // 2> UILabel
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.bounds.size.height, viewW, 20)];
//        UILabel *label = appView.subviews[1];
//        UILabel *label = (UILabel *) [appView viewWithTag:2];
        
        // 设置文字
//        label.text = appInfo.name;
//        appView.nameLabel.text = appInfo.name;
        
        // 3> UIButton
        // UIButtonTypeCustom和[[UIButton alloc] init]是等价的
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        UIButton *button = appView.subviews[2];
//        UIButton *button = (UIButton *) [appView viewWithTag:3];
        
        
//        [button setTitle:@"下载" forState:UIControlStateNormal];
        // *** 不能使用如下代码直接设置title
        //        button.titleLabel.text = @"下载";
        // @property中readonly表示不允许修改对象的指针地址，但是可以修改对象的属性
//        button.titleLabel.font= [UIFont systemFontOfSize:14.0];
        
//        [button setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
//        [button setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        
        
//        appView.btn.tag = i;
        
//        [appView.btn addTarget:self action:@selector(downloadClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

//- (void) downloadClick:(UIButton *)button{
//   
//}

@end

