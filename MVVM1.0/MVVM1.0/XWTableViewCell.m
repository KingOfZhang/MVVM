//
//  XWTableViewCell.m
//  MVVM1.0
//
//  Created by 易云时代 on 2017/7/27.
//  Copyright © 2017年 笑伟. All rights reserved.
//

#import "XWTableViewCell.h"

#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface XWTableViewCell()
@property (nonatomic ,weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *detailLabel;
@end
@implementation XWTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self creatUI];
    }
    return self;
        
}
-(void)creatUI{
    UILabel *titleLabel = [UILabel new];
    titleLabel.textColor = [UIColor redColor];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.frame = CGRectMake(10, 10, 80, 30);
    [self.contentView addSubview:titleLabel];
    _titleLabel = titleLabel;
    
    UILabel *detailLabel = [UILabel new];
    detailLabel.textColor = [UIColor grayColor];
    detailLabel.font = [UIFont systemFontOfSize:14];
    detailLabel.frame = CGRectMake(120, 10, WIDTH - 130, 30);
    [self.contentView addSubview:titleLabel];
    _detailLabel = detailLabel;
    
}
- (void)setCellModel:(RowModel *)cellModel{
    _cellModel = cellModel;
    self.titleLabel.text = cellModel.title;
    self.detailLabel.text = cellModel.detail;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
