//
//  HomeTabViewController.m
//  SixLink
//
//  Created by 萝卜 on 15/11/9.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "HomeTabViewController.h"

@interface HomeTabViewController ()<UITabBarControllerDelegate>

@end

@implementation HomeTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    UITabBar *tabBar = self.tabBar;
    UITabBarItem *item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabBar.items objectAtIndex:2];
    
    // 对item设置相应的图片
    item0.selectedImage = [[UIImage imageNamed:@"albums-select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item0.image = [[UIImage imageNamed:@"albums"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];    
    
    item1.image = [[UIImage imageNamed:@"help"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.selectedImage = [[UIImage imageNamed:@"help-select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    item2.image = [[UIImage imageNamed:@"user"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.selectedImage = [[UIImage imageNamed:@"user-select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    if (self.autoLoginRequired) {
        
        [self processAutoLoginWithBlock:^{
            
            
        }];
        
    }
//    [UITabBar appearance] setTintColor:[UIColor ]
    
    // Do any additional setup after loading the view.
}
- (void) processAutoLoginWithBlock:(void (^)())block{
    
    AppDelegate *appDel = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [appDel presentLoginPage];


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
