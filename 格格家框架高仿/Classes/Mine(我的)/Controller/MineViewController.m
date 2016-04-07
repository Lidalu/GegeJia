//
//  MineViewController.m
//  高仿格格家
//
//  Created by ma c on 3/23/16.
//  Copyright © 2016 lu. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@property (nonatomic, strong) UIBarButtonItem *settingBarItem;

@end

@implementation MineViewController

#pragma mark - getter and setter
- (UIBarButtonItem *)settingBarItem {
    
    if (!_settingBarItem) {
        
        UIImage *settingBarItemImage = [UIImage imageNamed:@"setting"];
        settingBarItemImage = [settingBarItemImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _settingBarItem = [[UIBarButtonItem alloc] initWithImage:settingBarItemImage style:UIBarButtonItemStylePlain target:self action:nil];
    }
    return _settingBarItem;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    self.navigationItem.rightBarButtonItem = self.settingBarItem;
    
    // Do any additional setup after loading the view.
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
