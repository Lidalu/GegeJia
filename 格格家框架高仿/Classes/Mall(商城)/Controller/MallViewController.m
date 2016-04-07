//
//  MallViewController.m
//  高仿格格家
//
//  Created by ma c on 3/23/16.
//  Copyright © 2016 lu. All rights reserved.
//
/*
 http://app.gegejia.com/yangege/appNative/mall/home
 params:{"accountId":"696767"}
 os 2
 sign A34A0E93699AE683
 version 2.4
 
 */

#import "MallViewController.h"

@interface MallViewController ()

@property (nonatomic, strong) UIButton *NavBtn;

@end

@implementation MallViewController

- (UIButton *)NavBtn {
    
    if (!_NavBtn) {
        
        _NavBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _NavBtn.frame = CGRectMake(20, 10, SCREEN_WIDTH - 40, 44);
        [_NavBtn setBackgroundColor:[UIColor whiteColor]];
        [_NavBtn setTitle:@"搜索喜欢的内容" forState:UIControlStateNormal];
    }
    return _NavBtn;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.NavBtn;
    self.view.backgroundColor = [UIColor cyanColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
