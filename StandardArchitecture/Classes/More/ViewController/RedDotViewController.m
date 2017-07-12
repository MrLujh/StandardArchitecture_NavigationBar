//
//  RedDotViewController.m
//  StandardArchitecture
//
//  Created by lujh on 2017/7/12.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "RedDotViewController.h"

@interface RedDotViewController ()

@end

@implementation RedDotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationBarTitle:@"Tabbar小红点测试"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RedDot" object:nil];
}

-(void)dealloc {

    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

@end
