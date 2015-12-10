//
//  UIViewController+NavigationButton.m
//  SixLink
//
//  Created by 袁斌 on 15/11/10.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "UIViewController+NavigationButton.h"
@implementation UIViewController (NavigationButton)

-(void)createLeftNavigationItemsWithTitle:(NSString *)title imagesName:(NSString *)imagesName action:(blockAction)action
{
    [self createLeftNavigationItemsWithTitle:title imagesName:imagesName imageDirection:NavigationIconLeft action:action];
}

-(void)createLeftNavigationItemsWithTitle:(NSString *)title imagesName:(NSString *)imagesName imageDirection:(NavigationIconDirection)imageDirection action:(blockAction)action
{
    [self createNavigationItemsWithTitle:title imagesName:imagesName imageDirection:imageDirection isLeft:YES  action:(blockAction)action];
}

-(void)createRightNavigationItemsWithTitle:(NSString *)title imagesName:(NSString *)imagesName action:(blockAction)action
{
    [self createRightNavigationItemsWithTitle:title imagesName:imagesName imageDirection:NavigationIconLeft action:action];
}

-(void)createRightNavigationItemsWithTitle:(NSString *)title imagesName:(NSString *)imagesName imageDirection:(NavigationIconDirection)imageDirection action:(blockAction)action
{
    [self createNavigationItemsWithTitle:title imagesName:imagesName imageDirection:imageDirection isLeft:NO  action:(blockAction)action];
}

- (void)createNavigationItemsWithTitle:(NSString *)title imagesName:(NSString *)imagesName imageDirection:(NavigationIconDirection)imageDirection isLeft:(BOOL)isLeft action:(blockAction)action
{
    
    BlockButton *theBtn = [BlockButton buttonWithType:UIButtonTypeCustom];
    theBtn.frame = CGRectMake(0, 0, 50, 50);
    theBtn.imageView.contentMode = UIViewContentModeCenter;
    theBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [theBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    theBtn.blockAction = action;
    
    if (title && imagesName) {
        
        if (imageDirection == NavigationIconLeft) {
            
            theBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            theBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;

        }else if(imageDirection == NavigationIconRight){
            //暂时不能用
            [theBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 32, 0, 0)];
            [theBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 32)];
        }else{
            
        }
        [theBtn setTitle:title forState:UIControlStateNormal];
        [theBtn setTitle:title forState:UIControlStateSelected];
        [theBtn setTitle:title forState:UIControlStateHighlighted];
        
        [theBtn setImage:[UIImage imageNamed:imagesName] forState:UIControlStateNormal];
        [theBtn setImage:[UIImage imageNamed:imagesName] forState:UIControlStateSelected];
        [theBtn setImage:[UIImage imageNamed:imagesName] forState:UIControlStateHighlighted];
        
    }else if (title && imagesName == nil){
        if (isLeft == YES) {
            theBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

        }else{
            theBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;

        }
        
        [theBtn setTitle:title forState:UIControlStateNormal];
        [theBtn setTitle:title forState:UIControlStateSelected];
        [theBtn setTitle:title forState:UIControlStateHighlighted];

    }else if (imagesName && title == nil){
        
        if (isLeft == YES) {

            theBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        }else{

            theBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;

        }
        
        [theBtn setImage:[UIImage imageNamed:imagesName] forState:UIControlStateNormal];
        [theBtn setImage:[UIImage imageNamed:imagesName] forState:UIControlStateSelected];
        [theBtn setImage:[UIImage imageNamed:imagesName] forState:UIControlStateHighlighted];


    }else{
    }
    
    if (isLeft == YES) {
        UIBarButtonItem *flexSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                   target:self
                                                                                   action:nil];
        flexSpacer.width = 0;
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:theBtn];
        temporaryBarButtonItem.style = UIBarButtonItemStylePlain;
        self.navigationItem.leftBarButtonItems = @[temporaryBarButtonItem];

        
    }else{
        UIBarButtonItem *flexSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                   target:self
                                                                                   action:nil];
        flexSpacer.width = 0;

        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:theBtn];
        temporaryBarButtonItem.style = UIBarButtonItemStylePlain;
        self.navigationItem.rightBarButtonItems = @[temporaryBarButtonItem];
        
    }
    
    
}

@end
