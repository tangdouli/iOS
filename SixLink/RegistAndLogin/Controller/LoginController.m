//
//  LoginController.m
//  SixDegreesFinancial
//
//  Created by 萝卜 on 15/11/6.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "LoginController.h"

@interface LoginController (){

   NSString * keyStr;

}

//用来控制出现键盘 调整高度
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (weak, nonatomic) IBOutlet UIButton *gapPassWordLog;

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;


@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMathod];
}
-(void)setMathod{
    UIButton *clearButton = [self.phoneNumberTextField valueForKey:@"_clearButton"];
    [clearButton setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    UIButton *clearButtonPassword = [self.passWordTextField valueForKey:@"_clearButton"];
    [clearButtonPassword setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    
    [self.phoneNumberTextField setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.passWordTextField setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    
//    [[IQKeyboardManager sharedManager] setKeyboardDistanceFromTextField:80*FONT_SIZE];

    _phoneNumberTextField.text = [Tool isForget]==YES ? [UserModel userInfoFromFile].mobile:@"";
    //出现键盘的通知
    keyStr = @"no";
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //键盘消失的方法
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
    

}
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    if ([keyStr isEqualToString:@"no"]) {
        
       
            [UIView animateWithDuration:0.2 animations:^{
                self.imageIcon.frame = CGRectMake(self.imageIcon.frame.origin.x, self.imageIcon.frame.origin.y-500, self.imageIcon.frame.size.width,self.imageIcon.frame.size.height);
                self.bottomView.frame = CGRectMake(self.bottomView.frame.origin.x,self.view.frame.origin.y+64-10, self.bottomView.frame.size.width, self.bottomView.frame.size.height);
            }];

           keyStr = @"yes";
    }else{
    }
    keyStr = @"yes";
}
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    if ([keyStr isEqualToString:@"yes"]) {

            [UIView animateWithDuration:0.2 animations:^{
                self.imageIcon.frame = CGRectMake(self.imageIcon.frame.origin.x, self.imageIcon.frame.origin.y+500, self.imageIcon.frame.size.width,self.imageIcon.frame.size.height);
                NSLog(@"高度高度---》%f",self.bottomView.frame.origin.y);
                self.bottomView.frame = CGRectMake(self.bottomView.frame.origin.x,self.view.frame.size.height-self.bottomView.frame.size.height, self.bottomView.frame.size.width, self.bottomView.frame.size.height);
            }];
            
        
        keyStr = @"no";
        
        
    }else{
        
    }
    keyStr = @"no";
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


    [self.phoneNumberTextField resignFirstResponder];
    [self.passWordTextField resignFirstResponder];


}
#pragma mark----xib点击事件
//注册
- (IBAction)resignBtnAction:(id)sender {
     
    
    [Tool setIsForget:NO];//若是从忘记密码进来的，跳进去的是重置密码，所以置NO
    
    RegisterController *registerC =[[RegisterController alloc]init];
    
    [self.navigationController pushViewController:registerC animated:YES];

}
//登录
- (IBAction)loginBtnAction:(id)sender {
    
    if ([_phoneNumberTextField.text isEqualToString:@""]) {
        AlertMsg(@"手机号码不能为空")
    }else if ([_passWordTextField.text isEqualToString:@""]){
        AlertMsg(@"密码不能为空")
    }else{
        
    }
    
    AppDelegate *appDel = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [appDel presentHomePageWithAutoLogin:NO];
    
}
-(void)gotoGesture
{
    GestureViewController *sq = [[GestureViewController alloc] initWithNibName:@"GestureViewController" bundle:nil];
    sq.style = ResetMode;
    sq.isRegister = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController pushViewController:sq animated:NO];
    });

}
//手势密码登录
- (IBAction)gapPassWordLoginAction:(id)sender {
    GestureViewController *sq = [[GestureViewController alloc] initWithNibName:@"GestureViewController" bundle:nil];
    sq.style = VerifyMode;
    sq.isRegister = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController pushViewController:sq animated:NO];
    });
    

}
//忘记密码
- (IBAction)forgetPassWordAction:(id)sender {
    
    
    ForgetPassController *forget =[[ForgetPassController alloc]init];
    
    [self.navigationController pushViewController:forget animated:YES];
}
- (IBAction)eyeBtnAction:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
   
    if (btn.selected == YES) {
     self.passWordTextField.secureTextEntry = NO;
    }else{
    
     self.passWordTextField.secureTextEntry = YES;
    
    }
     btn.selected = !btn.selected;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden =YES;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
