
//
//  NavigationViewController.m
//  StandardArchitecture
//
//  Created by lujh on 2017/7/7.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()<UINavigationControllerDelegate>

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark -拦截Push事件

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
     [super pushViewController:viewController animated:animated];
}

@end
