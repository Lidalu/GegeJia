//
//  LLuActivityCell.m
//  高仿格格家
//
//  Created by ma c on 3/25/16.
//  Copyright © 2016 lu. All rights reserved.
//

#import "LLuActivityCell.h"

@interface LLuActivityCell ()

@property (nonatomic, strong) UIImageView *iconView;

@end

@implementation LLuActivityCell

- (void)setActivity:(ActivityContent *)activity {
    
    _activity = activity;
    
    NSURL *imageUrl = [NSURL URLWithString:activity.image];
    [_iconView sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"btnAddtoCart"]];
//    self.iconView.image = [UIImage imageNamed:@"btnAddtoCart"];
    
}

- (UIImageView *)iconView {
    
    if (!_iconView) {
        
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self.contentView addSubview:self.iconView];
    }
    return self;
}

- (void)layoutSubviews {
    
    UIView *superView = self.contentView;
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.and.left.and.right.and.bottom.equalTo(superView);
    }];
}

@end
