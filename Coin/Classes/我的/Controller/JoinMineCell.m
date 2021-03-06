//
//  JoinMineCell.m
//  Coin
//
//  Created by shaojianfei on 2018/6/7.
//  Copyright © 2018年 chengdai. All rights reserved.
//

#import "JoinMineCell.h"
#import "Masonry.h"
#import "UILabel+Extension.h"
#import "UILable+convience.h"
#import "AppColorMacro.h"
@interface  JoinMineCell()

@property (nonatomic , strong) UILabel *nameLab;

@property (nonatomic , strong) UILabel *contentLab;


@end
@implementation JoinMineCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self initSubviews];
        
    }
    
    return self;
}
- (void)initSubviews {
    
    self.nameLab = [UILabel labelWithBackgroundColor:kWhiteColor textColor:kTextColor font:15];
    [self addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@15);
        
    }];
    
    self.contentLab = [UILabel labelWithBackgroundColor:kWhiteColor textColor:kTextColor2 font:15];
    [self addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.right.equalTo(@-15);

    }];
}

-(void)setModel:(JoinModel *)model
{
    
    _model = model;
    self.nameLab.text = model.name;
    self.contentLab.text = model.content;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
