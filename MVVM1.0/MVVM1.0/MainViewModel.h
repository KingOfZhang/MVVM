//
//  MainViewModel.h
//  MVVM1.0
//
//  Created by 易云时代 on 2017/7/26.
//  Copyright © 2017年 笑伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RowModel.h"
#import "SectionModel.h"

typedef void (^UpdateCellBlock)(NSIndexPath *indexPath);

@interface MainViewModel : NSObject
@property (nonatomic, copy) UpdateCellBlock updateCellBlock;

- (void)changeCellModelWithIndexPath:(NSIndexPath *)indexPath;
-(RowModel *)getRowModelWithIndexPath:(NSIndexPath *)indexPatch;
- (NSInteger)getCellCountWithIndexPath:(NSInteger)section;
- (NSInteger)getSectionCount;
- (SectionModel *)getSectionModelWithSection:(NSInteger)section;
@end
