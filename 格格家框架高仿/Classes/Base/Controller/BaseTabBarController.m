//
//  BaseTabBarController.m
//  高仿格格家
//
//  Created by ma c on 3/23/16.
//  Copyright © 2016 lu. All rights reserved.
//

#import "BaseTabBarController.h"
#import "ControllersModel.h"

@interface BaseTabBarController ()

@property (nonatomic, strong) NSArray *controllersList;

@property (nonatomic, strong) NSMutableArray *controllers;

@end

@implementation BaseTabBarController

#pragma mark - getter and setter

- (NSArray *)controllersList {
    
    if (!_controllersList) {
        
        _controllersList = [ControllersModel controllersList];
    }
    return _controllersList;
}

- (NSMutableArray *)controllers {
    
    if (!_controllers) {
        
        _controllers = [NSMutableArray array];
    }
    return _controllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildViewController];
}

/**
 *  添加子控制器，通过plist转模型，复用性高
 */
- (void)setUpChildViewController{
    
    for (NSInteger i = 0; i < self.controllersList.count; i++) {
        
        ControllersModel *controllerModel = self.controllersList[i];
        NSString *tabBartitle = controllerModel.tabBartitle;
        NSString *tabBarSelectedImageName = controllerModel.ControllerTabbarIcon_Selected;
        NSString *tabBarNormalImageName = controllerModel.ControllerTabbarIcon_Normal;
        NSString *rigthBarItemImageName = controllerModel.rightBarItemIconName;
        NSString *leftBarItemImageName = controllerModel.leftBarItemIconName;
        NSString *viewControllerName = controllerModel.controllerName;
        
        UINavigationController *Nav = [[UINavigationController alloc] initWithRootViewController:[[NSClassFromString(viewControllerName) alloc] init]];
        
        [self setupOneChildViewController:Nav
                    tabBarNormalImageName:tabBarNormalImageName
                  tabBarSelectedImageName:tabBarSelectedImageName
                     leftBarItemImageName:leftBarItemImageName
                    rigthBarItemImageName:rigthBarItemImageName
                              tabBartitle:tabBartitle];
        
        
        [self.controllers addObject:Nav];
    }
    
    self.viewControllers = self.controllers;
}

/**
 *  添加一个子控制器
 *
 *  @param viewController          viewController
 *  @param tabBarNormalImageName   tabBar的Normal图片
 *  @param tabBarSelectedImageName tabBar的选中图片
 *  @param leftBarItemImageName    ViewController导航条的左buttonItem
 *  @param rigthBarItemImageName   ViewController导航条的右buttonItem
 *  @param title                   tabBar的标题
 */
- (void)setupOneChildViewController:(UIViewController *)viewController
              tabBarNormalImageName:(NSString *)tabBarNormalImageName
            tabBarSelectedImageName:(NSString *)tabBarSelectedImageName
               leftBarItemImageName:(NSString *)leftBarItemImageName
              rigthBarItemImageName:(NSString *)rigthBarItemImageName
                        tabBartitle:(NSString *)tabBartitle{
    
    
    //tabBarNormalImage
    UIImage *tabBarNormalImage = [UIImage imageNamed:tabBarNormalImageName];
    tabBarNormalImage = [tabBarNormalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarSelectedImage
    UIImage *tabBarSelectedImage = [UIImage imageNamed:tabBarSelectedImageName];
    tabBarSelectedImage = [tabBarSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    viewController.tabBarItem.image = tabBarNormalImage;
    viewController.tabBarItem.selectedImage = tabBarSelectedImage;
    
//    UIImage *leftBarButtonItemImage = [UIImage imageNamed:leftBarItemImageName];
//    UIImage *rightBarButtonItemImage = [UIImage imageNamed:rigthBarItemImageName];
    
//    UIButton *leftBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [leftBarButton setImage:leftBarButtonItemImage forState:UIControlStateNormal];
    
//    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarButton];
    
//    UIButton *rightBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [leftBarButton setImage:rightBarButtonItemImage forState:UIControlStateNormal];
    
//    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarButton];
    
//    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftBarButtonItemImage style:UIBarButtonItemStylePlain target:viewController action:nil];
//    viewController.navigationItem.leftBarButtonItem = leftBarButtonItem;
//    
//    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:rightBarButtonItemImage style:UIBarButtonItemStylePlain target:viewController action:nil];
//    viewController.navigationItem.leftBarButtonItem = rightBarButtonItem;
    
    viewController.tabBarItem.title = tabBartitle;
    
    //调整Tabbar的title位置
    viewController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -5);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
