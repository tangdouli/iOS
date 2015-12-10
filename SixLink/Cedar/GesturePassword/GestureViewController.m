//
//  GestureViewController.m
//  Gesture
//
//  Created by 袁斌 on 15/11/7.
//  Copyright © 2015年 yinbanke. All rights reserved.
//

#import "GestureViewController.h"
#import "PasswordButton.h"
#import "PasswordAccount.h"
#import "SixAngleIcon.h"
@interface GestureViewController ()<caseDelegate>
{
    NSMutableArray *buttonArray;
    CaseMode _style;
    __weak IBOutlet UIButton *forgetBtn;
    __weak IBOutlet UIButton *otherLoginBtn;
    __weak IBOutlet NSLayoutConstraint *gestureToBigView;
    GestureView *_gestureView;

    __weak IBOutlet NSLayoutConstraint *bigViewToBottom;
}
@property (weak, nonatomic) IBOutlet UIView *bigView;
@property (weak, nonatomic) IBOutlet UILabel *gestLabel;

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
- (IBAction)gotoAction:(UIButton *)sender;
- (IBAction)backAction:(UIButton *)sender;

@end

@implementation GestureViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _gestLabel.hidden = NO;
    _userLabel.hidden = forgetBtn.hidden = otherLoginBtn.hidden = _isRegister;
    _backButton.hidden = !_isRegister;
    self.navigationController.navigationBarHidden = YES;
    UBLog(@"PasswordAccount:%@",[PasswordAccount getPasswordWithMobileKey:[UserModel userInfoFromFile].mobile]);
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
int height = 15;
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    if (IS_IPHONE_5) {
        height = 45;
    }else if (IS_IPHONE_6){
        height =  85;
    }else if (IS_IPHONE_6P){
        height =  105;
    }else{
        height = 15;
    }
    bigViewToBottom.constant = height;
    _gestLabel.font = [UIFont systemFontOfSize:15*FONT_SIZE];
    _userLabel.font =[UIFont systemFontOfSize:15*FONT_SIZE];
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:13*FONT_SIZE];
    otherLoginBtn.titleLabel.font = [UIFont systemFontOfSize:13*FONT_SIZE];
    [self makeUI];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _userLabel.text = [UserModel userInfoFromFile].mobile;
    UBLog(@"%@",[UserModel userInfoFromFile].mobile);
}
-(void)makeUI
{
    buttonArray = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i=0; i<9; i++) {
        NSInteger row = i/3;
        NSInteger col = i%3;
        // Button Frame
        NSInteger margin = 40*FONT_SIZE;
        NSInteger size = ([UIScreen mainScreen].bounds.size.width - 4*margin) / 3;
        PasswordButton *gesturePasswordButton = [[PasswordButton alloc]initWithFrame:CGRectMake(margin+col*(size+margin), margin+row*(size+margin), size, size)];
        [gesturePasswordButton setTag:i];
        [_bigView addSubview:gesturePasswordButton];
        [buttonArray addObject:gesturePasswordButton];
    }
    [self createGestureViewWithStyle:_style];

}
//创建一个UI手势密码图
-(void)createGestureViewWithStyle:(CaseMode)style
{
    
    [[self.view viewWithTag:1000] removeFromSuperview];
    _gestureView = [[GestureView alloc] initWithFrame:_bigView.frame];
    _gestureView.tag = 1000;
    [self.view addSubview:_gestureView];
    _gestureView.style = style;
    [_gestureView setButtonArray:buttonArray];
    _gestureView.caseDelegate = self;
    if (_isRegister == YES) {
        _gestLabel.text = style == VerifyMode ? @"重复上次密码":@"绘制手势密码";
    }


}
#pragma mark - setTouchBeginDelegate
-(BOOL)verification:(NSString *)result
{
    
    NSString *password = [PasswordAccount getPasswordWithMobileKey:[UserModel userInfoFromFile].mobile];
    
    if ([result isEqualToString:password] == YES) {
        
        if (_isRegister == YES) {
            
            if ([Tool isForget] == YES) {
                [Tool setIsForget:NO];//找回了手势密码
                [Tool saveEndTimes:5];//重新给他5次机会绘制手势密码
                [self appLogin];
            }else{
                [self appLogin];
            }
            
        }else{
            
            [self appLogin];

        }
        
        UBLog(@"验证成功");
        return YES;
        
    }else{
     
        NSString *registerY = @"两次绘制的手势不一致，请重新绘制";
        NSString *registerN;

        int times = [Tool endTimes];
        if (_isRegister == NO) {
            times--;
            registerN = [NSString stringWithFormat:@"密码错误，你还有%d次机会",times];
            NSDate *currentDate = [NSDate date];
            NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
            [dateformatter setDateFormat:@"MMdd"];
            NSString *locationString=[dateformatter stringFromDate:currentDate];
            [Tool saveCurrentDate:locationString];
            [Tool saveEndTimes:times];
          
        }
        
        if (_isRegister == NO && times <= 0) {
            
            [self alertViewShowTip:@"你今天已经输入5次验证码了，请重新登录" completion:^(NSInteger index) {
                [Tool setIsForget:YES];//忘记手势密码了
                AppDelegate *appd = (AppDelegate *)[UIApplication sharedApplication].delegate;
                [appd presentLoginPage];
            }];
            
        }else{
            [self alertViewShowTip:_isRegister ? registerY:registerN  completion:^(NSInteger index) {
                [_gestureView enterArgin];
                [self gest];
            }];
        }
        
        return NO;
    }
    
}

//进入首页
-(void)appLogin
{
    AppDelegate *appDel = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDel presentHomePageWithAutoLogin:NO];

}
-(void)gest
{
    GestureViewController *sq = [[GestureViewController alloc] initWithNibName:@"GestureViewController" bundle:nil];
    sq.style = _isRegister ? ResetMode:VerifyMode;
    sq.isRegister = _isRegister;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController pushViewController:sq animated:NO];
    });
}

-(BOOL)resetPassword:(NSString *)result
{
        if (_isRegister == YES) {
            
            if (result.length < 4) {
                
                [self alertViewShowChoiceTip:@"手势密码不能小于四个点" title:nil button1Title:@"知道了" button2Title:nil completion:^(NSInteger index) {
                    [_gestureView enterArgin];
                    [self gest];
                }];
                
            }else{
                
                
            [PasswordAccount savePasswordDictWithMobileKey:[UserModel userInfoFromFile].mobile value:result];//存储当前注册用户的手势密码
                
            GestureViewController *sq = [[GestureViewController alloc] initWithNibName:@"GestureViewController" bundle:nil];
            sq.style = VerifyMode;
            sq.isRegister = YES;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController pushViewController:sq animated:NO];
            });
                
            }
        }
        return YES;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)gotoAction:(UIButton *)sender {
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (sender.tag == 611) {//忘记密码
        [Tool setIsForget:YES];
        [app presentLoginPage];
    }else{//切换登录方式
        [Tool setIsForget:NO];
        [app presentLoginPage];
    }
}
- (IBAction)backAction:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
