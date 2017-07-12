# StandardArchitecture_NavigationBar
导航栏 透明出来 侧滑
某个tabbar push过去的界面不支持侧滑
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 控制某个tabbar 不可以侧滑
    self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = NO;
    
    [self setNavigationBarTitle:@"分类"];
    
    // 初始化TableView
    [self setupTableView];

}

推荐tabbar push 侧滑返回导航栏标题不透明消失，在原来的基础上自定义了一个导航栏 一下是代码
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
 上面的两个初始化   次序不能颠倒    
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

分类tabbar push 侧滑返回导航栏标题透明消失
继承了基类的
导航栏
