//
//  MainView.m
//  MVVM1.0
//
//  Created by 易云时代 on 2017/7/27.
//  Copyright © 2017年 笑伟. All rights reserved.
//

#import "MainView.h"
#import "SectionModel.h"
#import "RowModel.h"
#import "XWTableViewCell.h"

#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width
@interface MainView()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) MainViewModel *viewModel;
@end
@implementation MainView

-(instancetype)initWithViewModel:(MainViewModel *)viewModel{
    if (self = [super init]) {
        self.viewModel = viewModel;
        [self configView];
    }
    return self;
}

-(void)configView{
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self addSubview:self.mainTableView];
}
#pragma mark - tableView delegate&dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.viewModel getSectionCount];
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SectionModel *model = [_viewModel getSectionModelWithSection:section];
    UILabel *headLabel = [UILabel new];
    headLabel.font = [UIFont systemFontOfSize:18];
    headLabel.text = [NSString stringWithFormat:@"%@",model.sectionName];
    return headLabel;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel getCellCountWithIndexPath:section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XWTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell == nil){
        cell = [[XWTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"XWTableViewCell"];
    }
     cell.cellModel = [self.viewModel getRowModelWithIndexPath:indexPath];
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel changeCellModelWithIndexPath:indexPath];
    [_mainTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
}
@end
