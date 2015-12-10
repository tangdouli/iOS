//
//  RegisterController.m
//  SixDegreesFinancial
//
//  Created by 萝卜 on 15/11/6.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "RegisterController.h"
#import "DesUtility.h"
@interface RegisterController ()
{

    NSTimer *_timer;
    int timecount;
    UIAlertView *alert;
     NSString *keyStr;

}
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMathod];
    [self makeAbout];
    
}

-(void)setMathod{
    
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
                
                self.imageIcon.frame = CGRectMake(self.imageIcon.frame.origin.x,self.imageIcon.frame.origin.y-500, self.imageIcon.frame.size.width, self.imageIcon.frame.size.width);
                self.bottomView.frame = CGRectMake(self.bottomView.frame.origin.x,self.view.frame.origin.y+64-10, self.bottomView.frame.size.width, self.bottomView.frame.size.height);
            }];
            

        
    }else{
    }
    
    keyStr = @"yes";
}
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    if ([keyStr isEqualToString:@"yes"]) {
        
        
        
            
            [UIView animateWithDuration:0.2 animations:^{
                 self.imageIcon.frame = CGRectMake(self.imageIcon.frame.origin.x,self.imageIcon.frame.origin.y+500, self.imageIcon.frame.size.width, self.imageIcon.frame.size.width);
                self.bottomView.frame = CGRectMake(self.bottomView.frame.origin.x,self.view.frame.size.height-self.bottomView.frame.size.height, self.bottomView.frame.size.width, self.bottomView.frame.size.height);
                
            }];
            
        
    }else{
        
    }
    keyStr = @"no";
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.mobileInput resignFirstResponder];
    [self.Security resignFirstResponder];


}

-(void)makeAbout{


    
    UIButton *backBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    
    backBtn.frame =CGRectMake(0, 0, 45, 45);
    
    [backBtn setImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
    
    [backBtn addTarget:self action:@selector(returnC:) forControlEvents:UIControlEventTouchUpInside];
    
    [self createLeftButton:backBtn];
    
    NSString *voice =@"收不到短信?试试语音验证码";
    
    NSMutableAttributedString *AttributedStrV = [Tool setOriginallyTitle:voice andFirstTextColor:[UIColor whiteColor] andLastText:COLOR_TEXT_REGISTER andTextFont:CodeBtn_Font andTextLeng:5];
    
    [self.voiceRecognition setAttributedTitle:AttributedStrV forState:UIControlStateNormal];
    
    [self.mobileInput setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.Security setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    UIButton *clearButton = [_mobileInput valueForKey:@"_clearButton"];
    [clearButton setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    [clearButton setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateHighlighted];
    UIButton *clearButton1 = [_Security valueForKey:@"_clearButton"];
    [clearButton1 setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    [clearButton1 setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateHighlighted];
    
//    [[IQKeyboardManager sharedManager] setKeyboardDistanceFromTextField:100*FONT_SIZE];

}

-(void)returnC:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];

}
-(NSMutableAttributedString *)voiceTextWithSecs:(int)sec
{
    NSString *lablere = [NSString stringWithFormat:@"%d",sec];
    NSString *labletitle = [NSString stringWithFormat:@"请等待接听电话，%@秒后可重试",lablere];
    NSMutableAttributedString *lablestr = [[NSMutableAttributedString alloc]initWithString:labletitle];
    [lablestr addAttributes:@{NSForegroundColorAttributeName : [UIColor redColor],NSFontAttributeName : CodeBtn_Font}  range:[labletitle rangeOfString:lablere]];
    return lablestr;
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


/******获取验证码******/
- (IBAction)getSecurityAction:(UIButton *)sender {
    
    if ([self.mobileInput.text isEqualToString:@""]) {

        AlertMsg(@"手机号码不能为空")
        
    }else if (![Tool regexPhoneWithString:self.mobileInput.text]){
        
        AlertMsg(@"手机号码格式不正确")
        
    }else{
        
        //voiceRecognition 语音验证码
        //getSecurityBtn;短信验证码
        timecount = 60;
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(beginFired:) userInfo:nil repeats:YES];
    
//        NSDictionary *parmas = [NSDictionary dictionaryWithObjectsAndKeys:[DesUtility desStringFromText:_mobileInput.text],@"mobile", nil];
        
        _voiceRecognition.enabled = NO;
        _getSecurityBtn.enabled = NO;
        
        if (sender.tag == 211) { //短信验证码
            
            [self voiceBtnIsSelected:NO];
//            
//            [[UB_NetworkManager defaultManager] POSTWithURL:SIXLINK_SMS parameters:parmas success:^(id responseObject) {
//                
//            } failure:^(NSError *error) {
//                
//                 [self restart];
//            }];
            

        }else{//语音验证码
            
            [self voiceBtnIsSelected:YES];
            
//            [[UB_NetworkManager defaultManager]POSTWithURL:SIXLINK_VOICE parameters:parmas success:^(id responseObject) {
//
//                } failure:^(NSError *error) {
//                     [self restart];
//                }];
            
        }
    }
    
}

-(void)voiceBtnIsSelected:(BOOL)isSelected
{
    _voiceRecognition.selected = isSelected;
    _getSecurityBtn.selected = !isSelected;
}

/******注册******/

- (IBAction)registerAction:(UIButton *)sender {

    if ([self.mobileInput.text isEqualToString:@""]) {
        
        [Tool showAlter:@"手机号码不能为空" andControl:self];
        
    }else if (![Tool regexPhoneWithString:self.mobileInput.text]){
        
        [Tool showAlter:@"手机号码格式不正确" andControl:self];

    }else if ([self.Security.text isEqualToString:@""]){
        
    [Tool showAlter:@"验证码不能为空" andControl:self];
    
    }else{
        
        NSDictionary *pramas = [NSDictionary dictionaryWithObjectsAndKeys:self.Security.text,@"smsVerifyCode",self.mobileInput.text,@"mobile", nil];
//        [[UB_NetworkManager defaultManager] GETWithURL:SIXLINK_MOBILEVERIFYCODE parameters:pramas success:^(id responseObject) {
//            
//            [Tool saveVerifyCode:self.Security.text];//记住当前的验证码
//            [Tool saveMobilePhone:self.mobileInput.text];//记住当前的手机号
//            
//            [[NSNotificationCenter defaultCenter]removeObserver:self];
//            SecondController *second =[[SecondController alloc]init];
//            [self.navigationController pushViewController:second animated:YES];
//
//        } failure:^(NSError *error) {
//            
//            
//        }];
    }
    
}

-(void)beginFired:(NSTimer *)theTimer{
    
    if (timecount < 1) {
    
        [self restart];//重新开始（恢复原状）
        
    }else{
        
        if (_getSecurityBtn.selected == YES) {
            
            [_getSecurityBtn setTitle:[NSString stringWithFormat:@"(%ds)重新获取",timecount--] forState:UIControlStateNormal];

        }else{
            
            _voiceRecognition.titleLabel.textColor = [UIColor whiteColor];
            [_voiceRecognition setAttributedTitle:[self voiceTextWithSecs:timecount--] forState:UIControlStateNormal];//倒计时
            
        }
        
    }
}
-(void)restart
{
    
    [_timer invalidate];
    _getSecurityBtn.enabled = YES;
    [_getSecurityBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    _voiceRecognition.enabled = YES;
    NSString *voice =@"收不到短信?试试语音验证码";
    NSMutableAttributedString *AttributedStrV = [Tool setOriginallyTitle:voice andFirstTextColor:[UIColor whiteColor] andLastText:COLOR_TEXT_REGISTER andTextFont:CodeBtn_Font andTextLeng:5];
    [_voiceRecognition setAttributedTitle:AttributedStrV forState:UIControlStateNormal];

}

- (IBAction)loginAction:(UIButton *)sender {
    
    LoginController *loginVC =[[LoginController alloc]init];
    
    [self.navigationController pushViewController:loginVC animated:YES];
    
    
}
@end
