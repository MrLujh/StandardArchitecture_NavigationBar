//
//  BaseViewController.h
//  StandardArchitecture
//
//  Created by lujh on 2017/7/11.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
/** 导航条View */
@property (nonatomic, strong) UIView *navBarView;

// 设置导航栏标题
-(void)setNavigationBarTitle:(NSString *)title;

@end
