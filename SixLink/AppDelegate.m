//
//  AppDelegate.m
//  SixLink
//
//  Created by 萝卜 on 15/11/9.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+addtional.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


-(void) presentHomePageWithAutoLogin:(BOOL) autoLogin{
    
    
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    
    UIStoryboard *leftStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HomeTabViewController *tabVc = [leftStory instantiateViewControllerWithIdentifier:@"TabController"];
    tabVc.autoLoginRequired = autoLogin;
    tabVc.selectedIndex = 0;
    tabVc.tabBar.tintColor = BarColor;
    self.window.rootViewController = tabVc;
    
}

//调出登录界面
-(void) presentLoginPage {
    
    LoginController *launchVc = [[LoginController alloc]init];
    UINavigationController *uv1 = [[UINavigationController alloc]initWithRootViewController:launchVc];
    uv1.navigationBarHidden = YES;
    self.window.tintColor = BarColor;
    [self.window setRootViewController:uv1];
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self appLogin];
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    [self appLogin];
    
    
}

-(void)appLogin
{
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        
        UIViewController *firstViewController = [[FirstStartController alloc] init];
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        self.window.rootViewController = firstViewController;
        
    }
    else{
        
        if (IS_LOGIN == YES) {
            
            [self presentGesturePasswordView];
            
        }else{
            
            LoginController *launchVc = [[LoginController alloc]init];
            UINavigationController *uv1 = [[UINavigationController alloc]initWithRootViewController:launchVc];
            uv1.navigationBarHidden = YES;
            self.window.tintColor = BarColor;
            [self.window setRootViewController:uv1];
        }
        
        //键盘管理
        [[IQKeyboardManager sharedManager] setEnable:YES];
//        [[IQKeyboardManager sharedManager] setKeyboardDistanceFromTextField:80*FONT_SIZE];
        [[IQKeyboardManager sharedManager] setShouldResignOnTouchOutside:YES];
//        [IQKeyboardManager sharedManager].enableAutoToolbar = YES;

        [[UINavigationBar appearance] setTranslucent:YES];
        
        [[UINavigationBar appearance] setBarTintColor:BarTintColor];
        
        [[UINavigationBar appearance] setTintColor:BarColor];
        
        NSDictionary *titleAttr = [NSDictionary dictionaryWithObjectsAndKeys:BarTxtColor,NSForegroundColorAttributeName,BarTitle_Font,NSFontAttributeName, nil];
        
        [[UINavigationBar appearance] setTitleTextAttributes:titleAttr];
        
        [self.window makeKeyAndVisible];
        
    }

}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//        exit(0);
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    dispatch_async(dispatch_queue_create("timerbackground", NULL), ^{
        [self addTimer];
    });
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
