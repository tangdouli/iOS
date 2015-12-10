//
//  UIViewController+NavigationButton.h
//  SixLink
//
//  Created by 袁斌 on 15/11/10.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockButton.h"

/**NavigationButton.image.drection*/
typedef enum{
    /*icon-left*/
    NavigationIconLeft,
    /*icon-right*/
    NavigationIconRight//暂时不用
    
}NavigationIconDirection;//direction

@interface UIViewController (NavigationButton)
/**
 *  右边按钮
 *
 *  @param title      标题
 *  @param imagesName 图片名
 *  @param action     创建按钮
 */
- (void)createRightNavigationItemsWithTitle:(NSString *)title imagesName:(NSString *)imagesName action:(blockAction)action;

/**
 *  左边边按钮
 *
 *  @param title      标题
 *  @param imagesName 图片名
 *  @param action     创建按钮
 */
- (void)createLeftNavigationItemsWithTitle:(NSString *)title imagesName:(NSString *)imagesName action:(blockAction)action;


//- (void)createRightNavigationItemsWithTitle:(NSString *)title imagesName:(NSString *)imagesName imageDirection:(NavigationIconDirection)imageDirection action:(blockAction)action;

//- (void)createLeftNavigationItemsWithTitle:(NSString *)title imagesName:(NSString *)imagesName imageDirection:(NavigationIconDirection)imageDirection action:(blockAction)action;


@end
