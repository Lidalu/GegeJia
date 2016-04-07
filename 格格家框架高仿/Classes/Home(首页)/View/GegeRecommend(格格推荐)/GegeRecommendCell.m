//
//  GegeRecommendCell.m
//  高仿格格家
//
//  Created by ma c on 3/25/16.
//  Copyright © 2016 lu. All rights reserved.
//

#import "GegeRecommendCell.h"

@interface GegeRecommendCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;


@end

@implementation GegeRecommendCell

#pragma mark - getter and setter

- (void)setGegeRecommend:(GeGeRecommendContent *)gegeRecommend {
    
    _gegeRecommend = gegeRecommend;
    
    NSURL *iconUrl = [NSURL URLWithString:gegeRecommend.image];
    [self.iconView sd_setImageWithURL:iconUrl placeholderImage:[UIImage imageNamed:@"home_default_goods"]];
//    self.iconView.image = [UIImage imageNamed:@"home_default_goods"];
}


@end
