//
//  MainViewModel.m
//  MVVM1.0
//
//  Created by 易云时代 on 2017/7/26.
//  Copyright © 2017年 笑伟. All rights reserved.
//

#import "MainViewModel.h"

@interface MainViewModel()

@property (nonatomic, strong) NSMutableArray *dataArray;//数据源

@end

@implementation MainViewModel
-(instancetype)init{
    if (self = [super init]) {
        [self configModelArr];
    }
    return self;
}
-(void)configModelArr{
    self.dataArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < 10; i++) {
        SectionModel *model = [SectionModel new];
        model.sectionName = [NSString stringWithFormat:@"%d狮子", i];
        NSMutableArray *array = [NSMutableArray array];
        for (int j = 0; j < 15; j++) {
            RowModel *rowModel = [RowModel new];
            rowModel.title = [NSString stringWithFormat:@"第%d行",i];
            rowModel.detail = [NSString stringWithFormat:@"这就是第%d的详情",i];
            [array addObject:rowModel];
        }
        model.rowModelArr = array;
        [self.dataArray addObject:model];
    }
    
}

#pragma mark - change Cell Model
-(void)changeCellModelWithIndexPath:(NSIndexPath *)indexPath{
    SectionModel *model = self.dataArray[indexPath.section];
    RowModel *rModel = model.rowModelArr[indexPath.row];
    rModel.title = @"替换***";
    rModel.detail = @"我是被替换的新cell";
}
#pragma mark - get SectionModel
- (SectionModel *)getSectionModelWithSection:(NSInteger)section {
    SectionModel *sModel = self.dataArray[section];
    return sModel;
}
#pragma mark - get CellModel
-(RowModel *)getRowModelWithIndexPath:(NSIndexPath *)indexPatch{
    SectionModel *mode = self.dataArray[indexPatch.section];
    NSArray *rowArr = mode.rowModelArr;
    RowModel *rModel = rowArr[indexPatch.row];
    return rModel;
}
#pragma mark - section Count
-(NSInteger)getSectionCount{
    return self.dataArray.count;
}
#pragma mark - cell Count
- (NSInteger)getCellCountWithIndexPath:(NSInteger)section {
    SectionModel *secModel = self.dataArray[section];
    return secModel.rowModelArr.count;
}

@end
