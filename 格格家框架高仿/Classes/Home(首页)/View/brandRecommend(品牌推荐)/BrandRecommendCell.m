//
//  BrandRecommendCell.m
//  高仿格格家
//
//  Created by ma c on 3/26/16.
//  Copyright © 2016 lu. All rights reserved.
//

#import "BrandRecommendCell.h"

@interface BrandRecommendCell ()

@property (nonatomic, weak) IBOutlet UIImageView *iconView;

@end

@implementation BrandRecommendCell

- (void)setBrandRecommend:(BrandRecommendComment *)brandRecommend {
    
    _brandRecommend = brandRecommend;
    
    NSURL *imageURL = [NSURL URLWithString:brandRecommend.image];
    [self.iconView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"home_default_hot"]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
