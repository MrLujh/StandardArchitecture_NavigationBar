

//
//  ClassificationViewController.m
//  StandardArchitecture
//
//  Created by lujh on 2017/7/12.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "ClassificationViewController.h"
#import "GroupViewController.h"

@interface ClassificationViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
// tableView
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ClassificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 控制某个tabbar 不可以侧滑
    self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = NO;
    
    [self setNavigationBarTitle:@"分类"];
    
    // 初始化TableView
    [self setupTableView];

}

#pragma mark -初始化TableView

- (void)setupTableView {
    
    // TableView
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TabBar_HEIGHT);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    // 设置导航栏
    self.navBarView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.navBarView];
}

#pragma mark -UITableViewDataSource delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 50;
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
   
    GroupViewController *vc = [[GroupViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offset_Y = scrollView.contentOffset.y;
    CGFloat alpha = (offset_Y)/300.0f;
    self.navBarView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:alpha];
}

@end
