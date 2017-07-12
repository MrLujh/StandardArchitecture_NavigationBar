
//
//  TabBarViewController.m
//  StandardArchitecture
//
//  Created by lujh on 2017/7/7.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "TabBarViewController.h"
#import "NavigationViewController.h"
#import "HomeViewController.h"
#import "RecommendViewController.h"
#import "ClassificationViewController.h"
#import "MoreViewController.h"
#import "TabBar.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController


-(void)viewWillAppear:(BOOL)animated {
    
    // 设置一个自定义 View,大小等于 tabBar 的大小
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    // 给自定义 View 设置颜色
    bgView.backgroundColor = [UIColor whiteColor];
    // 将自定义 View 添加到 tabBar 上
    [self.tabBar insertSubview:bgView atIndex:0];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化所有控制器
    [self setUpChildVC];
    
    // 创建tabbar的tabbarItem
    [self setUpTabbarItem];
    
}

#pragma mark -创建tabbar的tabbarItem

- (void)setUpTabbarItem {
    
    TabBar *tabBar = [[TabBar alloc] init];
    
    [self setValue:tabBar forKey:@"tabBar"];
    
}

#pragma mark -初始化所有控制器

- (void)setUpChildVC {
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    
    [self setChildVC:homeVC title:@"" image:@"tabBar_0" selectedImage:@"tabBar_0_selected"];
    
    RecommendViewController *recommendVC = [[RecommendViewController alloc] init];
    [self setChildVC:recommendVC title:@"" image:@"tabBar_1" selectedImage:@"tabBar_1_selected"];
    
    ClassificationViewController *ClassificationVC = [[ClassificationViewController alloc] init];
    [self setChildVC:ClassificationVC title:@"" image:@"tabBar_2" selectedImage:@"tabBar_2_selected"];
    
    MoreViewController *moreVC = [[MoreViewController alloc] init];
    [self setChildVC:moreVC title:@"" image:@"tabBar_3" selectedImage:@"tabBar_3_selected"];
    
}

- (void) setChildVC:(UIViewController *)childVC title:(NSString *) title image:(NSString *) image selectedImage:(NSString *) selectedImage {
    
    childVC.tabBarItem.title = title;
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"item name = %@", item.title);
    NSInteger index = [self.tabBar.items indexOfObject:item];
    [self animationWithIndex:index];
    if([item.title isEqualToString:@"发现"])
    {
        // 也可以判断标题,然后做自己想做的事<img alt="得意" src="http://static.blog.csdn.net/xheditor/xheditor_emot/default/proud.gif" />
    }
}
- (void)animationWithIndex:(NSInteger) index {
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.2;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.7];
    pulse.toValue= [NSNumber numberWithFloat:1.3];
    [[tabbarbuttonArray[index] layer]
     addAnimation:pulse forKey:nil];
}

@end
