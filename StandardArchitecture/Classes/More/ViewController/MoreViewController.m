//
//  MoreViewController.m
//  StandardArchitecture
//
//  Created by lujh on 2017/7/12.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationBarTitle:@"更多"];
    
    UIImage *image = [UIImage imageNamed:@"BackImagreView.jpg"];
    UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
    imageview.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - NavigationBar_HEIGHT - StatusBar_HEIGHT);
    [self.view addSubview:imageview];
}

@end
