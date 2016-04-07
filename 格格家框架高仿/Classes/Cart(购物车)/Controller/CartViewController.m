//
//  CartViewController.m
//  高仿格格家
//
//  Created by ma c on 3/30/16.
//  Copyright © 2016 lu. All rights reserved.
//
#import "CartViewController.h"
#import "UIImageView+GIF.h"

@interface CartViewController ()

/**
 *  empty_shoppingCartImageView
 */
@property (nonatomic, weak)  IBOutlet UIImageView *gifImageView;

@property (weak, nonatomic) IBOutlet UIButton *goHomeBtn;
@property (nonatomic, strong) UIView *gifView;

@end

@implementation CartViewController

#pragma mark - getter and setter
//
//- (UIView *)gifView {
//    
//    if (!_gifView) {
//        
//        _gifView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 4.0, 200, self.view.frame.size.width / 2.0, 225)];
//        
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
//        btn.frame = CGRectMake(_gifView.frame.size.width / 4.0, 205, _gifView.frame.size.width / 2.0, 20);
//        btn.layer.cornerRadius = 3;
//        btn.layer.borderColor = [UIColor redColor].CGColor;
//        btn.layer.borderWidth = 0.5;
//        btn.tintColor = [UIColor redColor];
//        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [btn setTitle:@"去逛逛" forState:UIControlStateNormal];
//        [_gifView addSubview:self.gifImageView];
//        [_gifView addSubview:btn];
//    }
//    return _gifView;
//}
//
//- (UIImageView *)gifImageView {
//    
//    if (!_gifImageView) {
//        
//        NSString *gifPath = [[NSBundle mainBundle] pathForResource:@"empty_shoppingCart@2x" ofType:@"gif"];
//        
//        _gifImageView = [UIImageView imageViewWithGIFFile:gifPath frame:CGRectMake(0, 0, self.gifView.frame.size.width, 200)];
//    }
//    return _gifImageView;
//}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"购物车";
    NSString *gifPath = [[NSBundle mainBundle] pathForResource:@"empty_shoppingCart@2x" ofType:@"gif"];
    self.gifImageView = [UIImageView imageViewWithGIFFile:gifPath frame:CGRectMake(0, 0, 0, 0)];;
    
    self.goHomeBtn.layer.borderColor = [UIColor redColor].CGColor;
    self.goHomeBtn.layer.borderWidth = 0.5;
    [self.goHomeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.goHomeBtn setBackgroundImage:[UIImage imageNamed:@"vipLevelBack"] forState:UIControlStateHighlighted];
    
}

@end
