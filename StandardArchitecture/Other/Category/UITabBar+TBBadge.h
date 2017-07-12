//
//  UITabBar+TBBadge.h
//  TabbarBeyondClick
//
//  Created by lujh on 2017/4/19.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (TBBadge)

- (void)showBadgeOnItemIndex:(int)index;   //显示小红点

- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点
@end
