
//
//  TabBar.m
//  StandardArchitecture
//
//  Created by lujh on 2017/7/7.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "TabBar.h"
#import "UIView+Frame.h"

@implementation TabBar


- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 其他位置按钮
    NSUInteger count = self.subviews.count;
    for (NSUInteger i = 0 , j = 0; i < count; i++) {
        UIView *view = self.subviews[i];
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            view.width = self.width / 4.0;
            view.x = self.width * j / 4.0;
            view.y = 7;
            j++;
            
        }
    }
}

@end
