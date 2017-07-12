

//
//  RecommendViewController.m
//  StandardArchitecture
//
//  Created by lujh on 2017/7/12.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "RecommendViewController.h"
#import "FriendViewController.h"

@interface RecommendViewController ()<UITableViewDataSource, UITableViewDelegate>
/** tableView */
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation RecommendViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏标题
    [self setNavigationBarTitle:@"推荐"];
    
    // 初始化tableView
    [self setupTableView];
   
}

#pragma mark -初始化tableView

- (void)setupTableView {

    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT -StatusBar_HEIGHT -NavigationBar_HEIGHT -TabBar_HEIGHT);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

}

#pragma mark -UITableViewDataSource delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"RecommendViewController";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"two -- %zd", indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    FriendViewController *vc = [[FriendViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
