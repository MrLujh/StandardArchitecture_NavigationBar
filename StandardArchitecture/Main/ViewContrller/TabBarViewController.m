
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
#import <AudioToolbox/AudioToolbox.h>

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
    homeVC.tabBarItem.badgeValue = @"1111";
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
    
    NSInteger index = [self.tabBar.items indexOfObject:item];
    
    [self animationWithIndex:index];
    
    if([item.title isEqualToString:@"首页"])
    {
        
    }
    
    [self playSoundEffect:@"11.mp3"];
}


/**
 * 播放音效文件
 *
 * @param name 音频文件名称 */
-(void)playSoundEffect:(NSString *)name{
    
    NSString *audioFile=[[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSURL *fileUrl=[NSURL fileURLWithPath:audioFile];
    //1.获得系统声音ID
    SystemSoundID soundID=0;
    /**
     * inFileUrl: 音频文件url
     * outSystemSoundID:声 id(此函数会将音效文件加入到系统音频服务中并返回一个长整形ID) */
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(fileUrl), &soundID);
    //如果需要在播放完之后执行某些操作,可以调用如下方法注册一个播放完成回调函数 AudioServicesAddSystemSoundCompletion(soundID, NULL, NULL, soundCompleteCallback, NULL);
    //2.播放音频
   // AudioServicesPlaySystemSound(soundID);//播放音效
    AudioServicesPlayAlertSound(soundID);//播放音效并震动
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
