//
//  HotCollectionViewCell.m
//  高仿格格家
//
//  Created by ma c on 3/26/16.
//  Copyright © 2016 lu. All rights reserved.
//

#import "HotCollectionViewCell.h"

@interface HotCollectionViewCell ()

@property (nonatomic, strong) IBOutlet UIImageView *iconView;

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) IBOutlet UILabel *priceLabel;

@end

@implementation HotCollectionViewCell

- (void)setHotGoods:(Hot *)hotGoods {
    
    _hotGoods = hotGoods;
    
    NSURL *iconURL = [NSURL URLWithString:hotGoods.image];
    [self.iconView sd_setImageWithURL:iconURL placeholderImage:[UIImage imageNamed:@"home_default_hot"]];
    self.titleLabel.text = hotGoods.title;
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %@", hotGoods.price];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
//    http://app.gegejia.com/yangege/appNative/resource/homeDetail
    
    /*
     
    params {"laterList":["3872","3846","1622","495","2796","2177","3710","3515","3727","822","1323","3900","3875","3891","3878","3882","3892","3759","3885","3849","3874","3866","3852","2830","3844","3839","3242","3074","1684","3630","3243","2928","1977","3751","2646","3131","3035","2363","1038","3363","2420","639","1834","2712","1291","3449","2328","820","1210"],"lastList":["3811","3804","2971","3797","3762","3816","3815","3810","3800","3790","3802","3796","3799","3791","3601","3597","3511","2608","3112","3483","2776","3027","3774","3777","3779","3776","3756","155","1145","2832","1823","3121","1891","1452","3140","769","3805","3807","3786","3781","3785","3773","3757","3771","3770","3752","3747","3729","3641","3738","2015","3586","3499","2205","2599","3462","3772","3244","3175","3414","2618","3362","76","3119","3274","1088","2869","3780","3349","2031","3884","3617","3858","1156","2717"],"nowList":["3923","3922","2935","3806","3886","3881","3871","3867","3441","2934","2861","3497","1015","3853","3859","3822","3818","3814","3798","2865","3767","3254","3325","1198","1765","1344","2509","2739","2460","3554","3079","2989","940","1980","2288","2456","3850","3352","3825","3045","1943","1768","3313","1118","3793","3812","3548","3855","3838","3083","1052","3883","3753","1806","3869","3862","3817","3002","3199","1176","3857","3863","3851","2903","2197","3832","3520","1310","3317","3821","3841","3860","3792","3811","3393","3870","3819","1732","3804","2971","3797","3762","3856","3845","3837","3848","3843","3835","3834","3829","3820","3823","1811","3298","3784","3795","3761","3562","1034","3635","2945","2503","3357","330","3123","2601","772","1548","1461","3816","3815","3810","2600","3800","3790","3802","3796","3799","3791","3601","3597","3511","2608","3112","3483","2776","3027","3774","3777","3779","3776","3756","155","1145","2832","1823","3121","1891","1452","3140","769","2558","3805","3807","3780","3786","3781","3785","3773","3757","3771","3770","3752","3747","3729","3641","3738","2015","3586","3499","2205","2599","3462","3772","3244","867","3175","3414","2618","3362","76","2426","3119","3274","1088","1135","2221","2137","2869","3413","1930","3468","236","3349","2031","3884","3617","3858","1156","2717"],"type":"238","accountId":"696767"}
     */
    
//    2
    
//    sign EFD4700AF7610630
//    version 2.4
}

- (void)layoutSubviews {
    
//    self.iconView.layer.borderColor = [UIColor grayColor].CGColor;
//    self.iconView.layer.borderWidth = 0.5;
}
@end
