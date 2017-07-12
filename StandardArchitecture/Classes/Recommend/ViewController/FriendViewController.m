//
//  FriendViewController.m
//  StandardArchitecture
//
//  Created by lujh on 2017/7/12.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "FriendViewController.h"
#import "ClassmatesViewController.h"

@interface FriendViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
// navigationBackView
@property (nonatomic, strong) UIView *navigationBackView;
// tableView
@property (nonatomic, strong) UITableView *tableView;
// headerHeight
@property (nonatomic, assign) CGFloat headerHeight;
// headerImageView
@property (nonatomic, strong) UIImageView *headerImageView;
// scale
@property (nonatomic, assign) CGFloat scale;
@end

@implementation FriendViewController

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
    
    // 初始化TableView
    [self setupTableView];
    
    // 初始化导航栏
    [self setupNavigationBar];
    
}

#pragma mark -初始化TableView

- (void)setupTableView {
    
    // TableView
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT );
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    //header
    self.headerHeight = 240;
    CGRect bounds = CGRectMake(0, 0, SCREEN_WIDTH, self.headerHeight);
    self.headerImageView = [[UIImageView alloc] initWithFrame:bounds];
    self.headerImageView.image = [UIImage imageNamed:@"1"];
    self.headerImageView.backgroundColor = [UIColor blackColor];
    
    UIView *headerView = [[UIView alloc] initWithFrame:bounds];
    [headerView addSubview:self.headerImageView];
    self.tableView.tableHeaderView = headerView;
}

#pragma mark -初始化导航栏

- (void)setupNavigationBar {
    
    // 导航栏背景view
    self.navigationBackView = [[UIView alloc] init];
    self.navigationBackView.frame = CGRectMake(0, 0, SCREEN_WIDTH, StatusBar_HEIGHT + NavigationBar_HEIGHT);
    [self.view addSubview:self.navigationBackView];
    
    // 导航栏左侧返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(20, 32, 12, 21);
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    backBtn.adjustsImageWhenHighlighted = NO;
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationBackView addSubview:backBtn];
    
    // 导航栏标题
    CGFloat titleW = SCREEN_WIDTH - 2*20 -2*10 -2*21;
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(backBtn.right, 20, titleW, NavigationBar_HEIGHT);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = Theme_Font_18;
    titleLabel.text = @"好友";
    [self.navigationBackView addSubview:titleLabel];
}

#pragma mark -UITableViewDataSource delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"FriendViewController";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"setting -- %zd", indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ClassmatesViewController *vc = [[ClassmatesViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    CGFloat offset_Y = scrollView.contentOffset.y;
    CGFloat alpha = (offset_Y)/300.0f;
    self.navigationBackView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:alpha];
    
    
    if (offset_Y < 0) {
        //放大比例
        CGFloat add_topHeight = -(offset_Y);
        self.scale = (self.headerHeight+add_topHeight)/self.headerHeight;
        
        CGRect imageView_frame = CGRectMake(-(SCREEN_WIDTH*self.scale-SCREEN_WIDTH)/2.0f,
                                            -add_topHeight,
                                            SCREEN_WIDTH*self.scale,
                                            self.headerHeight+add_topHeight);
        
        self.headerImageView.frame = imageView_frame;
    }
}

#pragma mark -导航栏返回按钮点击事件

- (void)backBtnClick {

    [self.navigationController popViewControllerAnimated:YES];
}

@end
