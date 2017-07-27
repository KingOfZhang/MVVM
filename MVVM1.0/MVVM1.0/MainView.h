//
//  MainView.h
//  MVVM1.0
//
//  Created by 易云时代 on 2017/7/27.
//  Copyright © 2017年 笑伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewModel.h"

@interface MainView : UIView
-(instancetype)initWithViewModel:(MainViewModel *)viewModel;
@end
