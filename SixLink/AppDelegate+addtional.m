//
//  AppDelegate+addtional.m
//  SixLink
//
//  Created by 萝卜 on 15/11/9.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "AppDelegate+addtional.h"

@implementation AppDelegate (addtional)

-(void)presentGesturePasswordView
{
    GestureViewController *sq = [[GestureViewController alloc] initWithNibName:@"GestureViewController" bundle:nil];
    sq.style = VerifyMode;
    sq.isRegister = NO;
    self.window.rootViewController = sq;
}
#pragma mark - 活跃的Ctrl
- (UIViewController *)activityViewController
{
    UIViewController* activityViewController = nil;
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if(window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow *tmpWin in windows)
        {
            if(tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    NSArray *viewsArray = [window subviews];
    if([viewsArray count] > 0)
    {
        UIView *frontView = [viewsArray objectAtIndex:0];
        
        id nextResponder = [frontView nextResponder];
        if([nextResponder isKindOfClass:[UIViewController class]])
        {
            activityViewController = nextResponder;
        }
        else
        {
            activityViewController = window.rootViewController;
        }
    }
    
    return activityViewController;
}

#pragma mark - 定时器

- (void)addTimer
{
    
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(verifyAction) userInfo:nil repeats:YES];
//    保持线程为活动状态，才能保证定时器执行
    [[NSRunLoop currentRunLoop] run];//已经将NSTimer添加到NSRunloop中了
}
/**
 *  校验当天是不是同一天
 */
-(void)verifyAction
{
    
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"MMdd"];
    NSString *locationString=[dateformatter stringFromDate:currentDate];
//    UBLog(@"locationString:%@",locationString);
    if ([locationString isEqualToString:[Tool currentDate]] == NO) {[Tool saveEndTimes:5];}
    
}

@end
