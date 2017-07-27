//
//  SectionModel.h
//  MVVM1.0
//
//  Created by 易云时代 on 2017/7/26.
//  Copyright © 2017年 笑伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SectionModel : NSObject
@property (nonatomic, copy) NSString *sectionName;
@property (nonatomic, strong) NSArray *rowModelArr;
@end
