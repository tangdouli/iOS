//
//  SecondController.m
//  SixLink
//
//  Created by 萝卜 on 15/11/10.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "SecondController.h"
#import "DesUtility.h"
@interface SecondController ()

@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UIButton *agreeMeent;


- (IBAction)nextAction:(id)sender;

//显示状态
- (IBAction)eyeAction:(id)sender;

//查看协议
- (IBAction)agreeMeentAction:(id)sender;

- (IBAction)returnAction:(id)sender;

@end

@implementation SecondController
-(void)viewWillAppear:(BOOL)animated{
    
    [self.password becomeFirstResponder];



}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.password setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    UIButton *clearButton = [self.password valueForKey:@"_clearButton"];
    [clearButton setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    
    NSString *agreement =@"注册即表示同意《六度注册协议》";
   
    NSMutableAttributedString *AttributedStrA = [Tool setOriginallyTitle:agreement andFirstTextColor:[UIColor whiteColor] andLastText:COLOR_TEXT_REGISTER andTextFont:CodeBtn_Font andTextLeng:8];

    [self.agreeMeent setAttributedTitle:AttributedStrA forState:UIControlStateNormal];

       // Do any additional setup after loading the view from its nib.
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

- (IBAction)nextAction:(id)sender {

    if ([Tool judgePassWordLegal:_password.text] == NO) {
        
        [Tool showAlter:@"密码必须大于六位\n必须同时包含数字和密码" andControl:self];
        return;
        
    }else{
        
        [self registerHttpResult];//先注册成功了 才去设置手势密码
    }
    
}
#pragma mark - 注册进入
-(void)registerHttpResult
{
    
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
- (IBAction)eyeAction:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
    
    if (btn.selected == YES) {
        
        self.password.secureTextEntry = NO;
    }else{
        
        self.password.secureTextEntry = YES;
        
    }
    
    btn.selected = !btn.selected;


}

- (IBAction)agreeMeentAction:(id)sender {
   
    
}

- (IBAction)returnAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
