//
//  UIViewController+alertView.m
//  SixLink
//
//  Created by 袁斌 on 15/11/11.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "UIViewController+alertView.h"

@implementation UIViewController (alertView)
//普通提示弹窗
-(void)alertViewShowTip:(NSString *)message
{
    [[AlertViewManager shareAlertView] showTipAlert:message];
}
- (void)alertViewShowTip:(NSString *)message completion:(choiceCompletionBlock)completion
{
    [[AlertViewManager shareAlertView] showTipAlert:message completion:completion];
}
//可以选择的弹窗
- (void)alertViewShowChoiceTip:(NSString *)message completion:(choiceCompletionBlock)completion
{
    [[AlertViewManager shareAlertView] showChoiceAlert:message completion:completion];
}
- (void)alertViewShowChoiceTip:(NSString *)message doneTitle:(NSString *)doneTitile completion:(choiceCompletionBlock)completion
{
    [[AlertViewManager shareAlertView] showChoiceAlert:message doneTitle:doneTitile completion:completion];
}
- (void)alertViewShowChoiceTip:(NSString *)message button1Title:(NSString *)title1 button2Title:(NSString *)title2 completion:(choiceCompletionBlock)completion
{
    [[AlertViewManager shareAlertView] showChoiceAlert:message button1Title:title1 button2Title:title2 completion:completion];
}
// 可自定义Title
- (void)alertViewShowChoiceTip:(NSString *)message title:(NSString *)title doneTitle:(NSString *)doneTitle completion:(choiceCompletionBlock)completion

{
    [[AlertViewManager shareAlertView] showChoiceAlert:message title:title doneTitle:doneTitle completion:completion];
}
- (void)alertViewShowChoiceTip:(NSString *)message title:(NSString *)title button1Title:(NSString *)button1Title button2Title:(NSString *)button2Title completion:(choiceCompletionBlock)completion
{
    [[AlertViewManager shareAlertView] showChoiceAlert:message title:title button1Title:button1Title button2Title:button2Title completion:completion];
}

//三选择弹窗
- (void)alertViewShowChoiceTip:(NSString *)message button1Title:(NSString *)title1 button2Title:(NSString *)title2 button3Title:(NSString *)title3 completion:(choiceCompletionBlock)completion
{
    [[AlertViewManager shareAlertView] showChoiceAlert:message button1Title:title1 button2Title:title2 button3Title:title3 completion:completion];
}



@end
