//
//  SuperViewController.m
//  SixLink
//
//  Created by 萝卜 on 15/11/9.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "SuperViewController.h"

@interface SuperViewController (){

    UIView *navigationController;
    UILabel *titleLabel;
    UIButton *leftCustomBtn;
    UIButton *rightCustomBtn;
    UIAlertView *errorAlert;
}

@end

@implementation SuperViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.barTintColor=NavBarColor;
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)createLeftButton:(UIButton *)leftBtn{
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    leftItem.style= UIBarButtonItemStylePlain;
   
//    self.navigationItem.leftBarButtonItem = leftItem;
    if (IS_LATER_IOS7) {
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -10.0f;
        self.navigationItem.leftBarButtonItems = @[negativeSpacer, leftItem];
    } else {
        self.navigationItem.leftBarButtonItem = leftItem;
    }
}

-(void)createRightButton:(UIButton*)rightBtn{
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
//    self.navigationItem.rightBarButtonItem = rightItem;
    rightItem.style = UIBarButtonItemStylePlain;
    if (IS_LATER_IOS7) {
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -5.0f;
            self.navigationItem.rightBarButtonItems = @[negativeSpacer, rightItem];
    } else {
            self.navigationItem.rightBarButtonItem = rightItem;
    }
    
}
-(void)createRightImg:(UIImageView*)rightImg{
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightImg];
    self.navigationItem.rightBarButtonItem = rightItem;

}

-(void)createNavgateTitle:(NSString*)title{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.text = title;
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:17];
    
    self.navigationItem.titleView = label;
    
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
