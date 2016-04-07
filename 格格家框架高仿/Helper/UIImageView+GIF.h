//
//  UIImageView+GIF.h
//  
//
//  Created by lu on 16/1/2.
//  Copyright © 2016年 lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (GIF)

// 从指定的路径加载GIF并创建UIImageView
+ (UIImageView *)imageViewWithGIFFile:(NSString *)file frame:(CGRect)frame;

+ (UIImageView *)imageViewWithGIFFile:(NSString *)file;

@end
