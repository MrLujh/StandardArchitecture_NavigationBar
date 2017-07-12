//
//  HomeViewController.m
//  StandardArchitecture
//
//  Created by lujh on 2017/7/11.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "HomeViewController.h"
#import "MoreViewController.h"
#import "PresentViewController.h"
#import "PushViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navBarView removeFromSuperview];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.navigationController.childViewControllers.count > 1) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化tableView
    [self setupTableView];
    
    // 初始化导航栏
    [self setupNavigationBar];
    
    // 初始化按钮
    [self setupButton];
    
}
#pragma mark -初始化tableView

- (void)setupTableView {
    
    _tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT  -TabBar_HEIGHT);
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];

}

#pragma mark -初始化导航栏

- (void)setupNavigationBar {

    // 导航栏背景view
    _navigationBackView = [[UIView alloc] init];
    _navigationBackView.frame = CGRectMake(0, 0, SCREEN_WIDTH, StatusBar_HEIGHT + NavigationBar_HEIGHT);
    [self.view addSubview:_navigationBackView];
}

#pragma mark -初始化按钮

- (void)setupButton {

    // push按钮
    CGFloat X = (self.view.frame.size.width - 100)/2.0;
    UIButton *pushBtn = [[UIButton alloc] init];
    pushBtn.frame = CGRectMake(X, 300, 100, 50);
    pushBtn.backgroundColor = [UIColor redColor];
    [pushBtn setTitle:@"push" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(pushBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
    
    
    // present按钮
    UIButton *presentBtn = [[UIButton alloc] init];
    presentBtn.frame = CGRectMake(X, 400, 100, 50);
    presentBtn.backgroundColor = [UIColor redColor];
    [presentBtn setTitle:@"present" forState:UIControlStateNormal];
    [presentBtn addTarget:self action:@selector(presentBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentBtn];

}

#pragma mark -push按钮点击事件

- (void)pushBtnClick {
    
    PushViewController *moreVc = [[PushViewController alloc] init];
    [self.navigationController pushViewController:moreVc animated:YES];
}

#pragma mark -present按钮点击事件

- (void)presentBtnClick {
    
    PresentViewController *presentVc = [[PresentViewController alloc] init];
    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:presentVc];
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark -UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 30;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第几%lu行",indexPath.row];
    
    return cell;
}

#pragma mark -UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offset_Y = scrollView.contentOffset.y;
    CGFloat alpha = (offset_Y)/300.0f;
    self.navigationBackView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:alpha];
}

@end
