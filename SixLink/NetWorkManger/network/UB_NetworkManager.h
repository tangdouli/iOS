//
//  UB_NetworkManager.h
//  SixLink
//
//  Created by 萝卜 on 15/11/9.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetContanst.h"

@interface UB_NetworkManager : NSObject
{
    MBProgressHUD *_waitView;
}

@property(copy,nonatomic)NSString *labelTextStr;
/**
 *  网络请求的单例
 *
 *  @param UB_NetworkManager defaultManager
 *
 *  @return UB_NetworkManager
 */
SingletonH(UB_NetworkManager)

/**
 *  get请求精简的
 *
 *  @param strURL     数据链接
 *  @param parameters 传参
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
-(void)GETWithURL:(NSString *)strURL parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 *  get请求自定义的多样化
 *
 *  @param strURL                数据链接
 *  @param parameters           传参
 *  @param requestType          请求成功的回调
 *  @param responseType         请求失败的回调
 *  @param progressHUDMode      加载视图的模式
 *  @param progressHUDAnimation 加载视图的动画
 *  @param success              请求成功的回调
 *  @param failure              请求失败的回调
 */
//-(void)GETWithURL:(NSString *)strURL parameters:(id)parameters requestType:(UB_NetworkRequestSerializer)requestType responseType:(UB_NetworkResponseSerializer)responseType  progressHUDMode:(UB_ProgressHUDMode)progressHUDMode progressHUDAnimation:(UB_ProgressHUDAnimation)progressHUDAnimation success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;



/**
 *  post请求精简的
 *
 *  @param strURL     数据链接
 *  @param parameters 传参
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
-(void)POSTWithURL:(NSString *)strURL parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 *  get请求自定义的多样化
 *
 *  @param strURL                数据链接
 *  @param parameters           传参
 *  @param requestType          请求成功的回调
 *  @param responseType         请求失败的回调
 *  @param progressHUDMode      加载视图的模式
 *  @param progressHUDAnimation 加载视图的动画
 *  @param success              请求成功的回调
 *  @param failure              请求失败的回调
 */
//-(void)POSTWithURL:(NSString *)strURL parameters:(id)parameters requestType:(UB_NetworkRequestSerializer)requestType responseType:(UB_NetworkResponseSerializer)responseType progressHUDMode:(UB_ProgressHUDMode)progressHUDMode progressHUDAnimation:(UB_ProgressHUDAnimation)progressHUDAnimation success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 *  delete请求
 *
 *  @param strURL     数据链接
 *  @param parameters 传参
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */

-(void)DELETEWithURL:(NSString *)strURL parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

//-(void)DELETEWithURL:(NSString *)strURL parameters:(id)parameters requestType:(UB_NetworkRequestSerializer)requestType responseType:(UB_NetworkResponseSerializer)responseType progressHUDMode:(UB_ProgressHUDMode)progressHUDMode progressHUDAnimation:(UB_ProgressHUDAnimation)progressHUDAnimation success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;



@end
