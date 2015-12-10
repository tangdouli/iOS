//
//  SuperViewController.h
//  SixLink
//
//  Created by 萝卜 on 15/11/9.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuperViewController : UIViewController

//左侧按钮
-(void)createLeftButton:(UIButton*)leftBtn;

//右侧按钮
-(void)createRightButton:(UIButton*)rightBtn;


-(void)createRightImg:(UIImageView*)rightBtn;

//导航文字
-(void)createNavgateTitle:(NSString*)title;

@end
