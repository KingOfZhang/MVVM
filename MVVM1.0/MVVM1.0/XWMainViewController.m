//
//  XWMainViewController.m
//  MVVM1.0
//
//  Created by 易云时代 on 2017/7/26.
//  Copyright © 2017年 笑伟. All rights reserved.
//

#import "XWMainViewController.h"
#import "MainViewModel.h"
#import "MainView.h"

@interface XWMainViewController ()
@property (nonatomic, strong) MainViewModel *viewModel;
@property (nonatomic, strong) MainView *mainView;
@end

@implementation XWMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"一个";
    self.view.backgroundColor = [UIColor greenColor];
    self.viewModel = [MainViewModel new];
    
    [self configMianView];
    
}
-(void)configMianView{
    self.mainView = [[MainView alloc]initWithViewModel:_viewModel];
    self.mainView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.mainView];
}
@end
