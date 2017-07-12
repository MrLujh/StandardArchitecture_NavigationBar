//
//  MoreViewController.m
//  StandardArchitecture
//
//  Created by lujh on 2017/7/12.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "MoreViewController.h"
#import "RedDotViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationBarTitle:@"更多"];
    
    // 初始化Subviews
    [self setupSubviews];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(redDotDisappear) name:@"RedDot" object:nil];
}

#pragma mark -初始化Subviews

- (void)setupSubviews {

    UIImage *image = [UIImage imageNamed:@"BackImagreView.jpg"];
    UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
    imageview.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - NavigationBar_HEIGHT - StatusBar_HEIGHT);
    [self.view addSubview:imageview];
    
    // 测试按钮
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(0, 0, 50, 50);
    btn.layer.cornerRadius = 25;
    btn.layer.masksToBounds = YES;
    btn.center = self.view.center;
    [btn setTitle:@"测试" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor cyanColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

#pragma mark -测试按钮点击事件

- (void)btnClick {
    
    
    RedDotViewController *vc = [[RedDotViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)redDotDisappear {
    
    //隐藏
    [self.tabBarController.tabBar hideBadgeOnItemIndex:4];
    
}

-(void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

@end
