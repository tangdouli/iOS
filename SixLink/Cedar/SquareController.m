//
//  SquareController.m
//  SixDegreesFinancial
//
//  Created by 萝卜 on 15/11/7.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "SquareController.h"
#import "PasswordButton.h"
#import "SixAngleIcon.h"
#import "UB_NetworkManager.h"
@interface SquareController ()

@end

@implementation SquareController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    UILabel *titleL = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,100,30)];
    titleL.text = @"个人中心";
    [titleL setTextColor:BarTxtColor];
    titleL.font =BarTitle_Font;
    [titleL setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = titleL;
    [Tool showAlter:@"密码必须大于六位\n必须同时包含数字和密码" andControl:self];
    
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
