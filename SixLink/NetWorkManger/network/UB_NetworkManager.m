//
//  UB_NetworkManager.m
//  SixLink
//
//  Created by 萝卜 on 15/11/9.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "UB_NetworkManager.h"

typedef NS_ENUM(NSInteger, UB_NetworkConnectType) {
    
    UB_NetworkConnectPOST = 0,
    UB_NetworkConnectGET,
    UB_NetworkConnectDELETE,

};

@implementation UB_NetworkManager

SingletonM(UB_NetworkManager)

-(instancetype)init
{
    self = [super init];
    if (self) {

    _labelTextStr = @"加载中...";
        
    }
    return self;
}

//GET简便请求
-(void)GETWithURL:(NSString *)strURL parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self GETWithURL:strURL parameters:parameters requestType:UB_NetworkDefaultRequestSerializer responseType:UB_NetworkDefaultResponseSerializer progressHUDMode:UB_ProgressHUDModeIndeterminate progressHUDAnimation:UB_ProgressHUDAnimationFade success:success failure:failure];
}

//GET具体请求
-(void)GETWithURL:(NSString *)strURL parameters:(id)parameters requestType:(UB_NetworkRequestSerializer)requestType responseType:(UB_NetworkResponseSerializer)responseType  progressHUDMode:(UB_ProgressHUDMode)progressHUDMode progressHUDAnimation:(UB_ProgressHUDAnimation)progressHUDAnimation success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self ConnectWithURL:strURL ConnectType:UB_NetworkConnectGET parameters:parameters requestType:requestType responseType:responseType progressHUDMode:progressHUDMode progressHUDAnimation:progressHUDAnimation success:success failure:failure];
    
}

//POST简便请求
-(void)POSTWithURL:(NSString *)strURL parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self POSTWithURL:strURL parameters:parameters requestType:UB_NetworkDefaultRequestSerializer responseType:UB_NetworkDefaultResponseSerializer progressHUDMode:UB_ProgressHUDModeIndeterminate progressHUDAnimation:UB_ProgressHUDAnimationFade success:success failure:failure];
}

//POST具体请求
-(void)POSTWithURL:(NSString *)strURL parameters:(id)parameters requestType:(UB_NetworkRequestSerializer)requestType responseType:(UB_NetworkResponseSerializer)responseType progressHUDMode:(UB_ProgressHUDMode)progressHUDMode progressHUDAnimation:(UB_ProgressHUDAnimation)progressHUDAnimation success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    
    [self ConnectWithURL:strURL ConnectType:UB_NetworkConnectPOST parameters:parameters requestType:requestType responseType:responseType progressHUDMode:progressHUDMode progressHUDAnimation:progressHUDAnimation success:success failure:failure];
    
}

//DELETE简单
-(void)DELETEWithURL:(NSString *)strURL parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    [self DELETEWithURL:strURL parameters:parameters requestType:UB_NetworkDefaultRequestSerializer responseType:UB_NetworkDefaultResponseSerializer progressHUDMode:UB_ProgressHUDModeIndeterminate progressHUDAnimation:UB_ProgressHUDAnimationFade success:success failure:failure];
}
//DELETE复杂
-(void)DELETEWithURL:(NSString *)strURL parameters:(id)parameters requestType:(UB_NetworkRequestSerializer)requestType responseType:(UB_NetworkResponseSerializer)responseType progressHUDMode:(UB_ProgressHUDMode)progressHUDMode progressHUDAnimation:(UB_ProgressHUDAnimation)progressHUDAnimation success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    
    [self ConnectWithURL:strURL ConnectType:UB_NetworkConnectDELETE parameters:parameters requestType:requestType responseType:responseType progressHUDMode:progressHUDMode progressHUDAnimation:progressHUDAnimation success:success failure:failure];
}

/**
 *  网络请求
 *
 *  @param strURL               链接
 *  @param ConnectType          请求方式
 *  @param parameters           参数
 *  @param requestType          类型
 *  @param responseType         返回类型
 *  @param progressHUDMode      视图方式
 *  @param progressHUDAnimation 动画
 *  @param success              成功
 *  @param failure              失败
 */
-(void)ConnectWithURL:(NSString *)strURL ConnectType:(UB_NetworkConnectType)ConnectType parameters:(id)parameters requestType:(UB_NetworkRequestSerializer)requestType responseType:(UB_NetworkResponseSerializer)responseType progressHUDMode:(UB_ProgressHUDMode)progressHUDMode progressHUDAnimation:(UB_ProgressHUDAnimation)progressHUDAnimation success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure

{
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    //判定有没有网络
    if (![self beforeExecute:manager]) {
        [self errorMessage:@"世界最遥远的距离就是没网！"];
        return;
    }
    
    switch (requestType) {
            
        case UB_NetworkDefaultRequestSerializer:
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
            
        case UB_NetworkHTTPRequestSerializer:
            manager.requestSerializer = [AFHTTPRequestSerializer serializer];
            break;
            
        case UB_NetworkJSONRequestSerializer:
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
            
        case UB_NetworkPropertyListRequestSerializer:
            manager.requestSerializer = [AFPropertyListRequestSerializer serializer];
            break;
            
        default:
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
            
    }
    
    switch (responseType) {
            
        case UB_NetworkDefaultResponseSerializer:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
            
        case UB_NetworkHTTPResponseSerializer:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
            
        case UB_NetworkJSONResponseSerializer:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
            
        case UB_NetworkPropertyListResponseSerializer:
            manager.responseSerializer = [AFPropertyListResponseSerializer serializer];
            break;
            
        case UB_NetworkXMLParserResponseSerializer:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
            
        case UB_NetworkImageResponseSerializer:
            manager.responseSerializer = [AFImageResponseSerializer serializer];
            break;
            
        case UB_NetworkCompoundResponseSerializer:
            manager.responseSerializer = [AFCompoundResponseSerializer serializer];
            break;
            
        default:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
    }
    
  
    @try {
        
        _waitView = [[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
        [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:_waitView];
        _waitView.tag = 11;
        [_waitView show:YES];
        
    }
    @catch (NSException *exception) {
        
        UBLog(@"exception:%@",exception);
        
    }
    @finally {
        _waitView = nil;
    }
    
    /**
     *  progressHUDMode
     */
    switch (progressHUDMode) {
        case UB_ProgressHUDModeIndeterminate: {
            _waitView.mode = MBProgressHUDModeIndeterminate;
            break;
        }
        case UB_ProgressHUDModeDeterminate: {
            _waitView.mode = MBProgressHUDModeDeterminate;
            break;
        }
        case UB_ProgressHUDModeDeterminateHorizontalBar: {
            _waitView.mode = MBProgressHUDModeDeterminateHorizontalBar;

            break;
        }
        case UB_ProgressHUDModeAnnularDeterminate: {
            _waitView.mode = MBProgressHUDModeAnnularDeterminate;

            break;
        }
        case UB_ProgressHUDModeCustomView: {
            _waitView.mode = MBProgressHUDModeCustomView;

            break;
        }
        case UB_ProgressHUDModeText: {
            
            _waitView.mode = MBProgressHUDModeText;

            break;
        }
        default: {
            
            _waitView.mode = MBProgressHUDModeIndeterminate;

            break;
        }
    }
    _waitView.labelText = _labelTextStr;

    
    switch (progressHUDAnimation) {
            
        case UB_ProgressHUDAnimationFade:
        case UB_ProgressHUDAnimationZoom:

        case UB_ProgressHUDAnimationZoomIn:

            _waitView.animationType = MBProgressHUDAnimationFade;
            break;
            
        default:
            _waitView.animationType = MBProgressHUDAnimationFade;
            break;
    }
    
    [manager.requestSerializer setValue:@"1.0.0" forHTTPHeaderField:@"accept-version"];
    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"ubankers"];
    
    [manager.securityPolicy setAllowInvalidCertificates:YES];
    /**
     *  ConnectType
     */
switch (ConnectType) {
          
 case UB_NetworkConnectGET:
      {
            
            UBLog(@">>>>>>GET>>parameters: %@",parameters);
            UBLog(@">>>>>>GET>>strURL: %@",strURL);
          
            [manager GET:strURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                UBLog(@">>>>>>GET>>net work success>>>>responseObject: %@",responseObject);
                [self removeMBView];
                success(responseObject);
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self removeMBView];
                UBLog(@">>>>>>GET>>net work failed>>>>responseObject: %@,error: %@", operation.responseObject, error);
                [self errorAction:error operation:operation];
                failure(error);

            }];
           break;
        }
        
          
            
  case UB_NetworkConnectPOST:
          
        {
            UBLog(@">>>>>>POST>>parameters: %@",parameters);
            UBLog(@">>>>>>POST>>strURL: %@",strURL);
            

            [manager POST:strURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                UBLog(@">>>>>>POST>>net work success>>>>responseObject: %@",responseObject);
                [self removeMBView];
                success(responseObject);

            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
                [self removeMBView];

                UBLog(@">>>>>>POST>>net work failed>>>>responseObject: %@,error: %@", operation.responseObject, error);
                [self errorAction:error operation:operation];
                failure(error);


            }];
            
             break;
        }
        
    case UB_NetworkConnectDELETE:{
        
        UBLog(@">>>>>>DELETE>>parameters: %@",parameters);
        UBLog(@">>>>>>DELETE>>strURL: %@",strURL);

        [manager DELETE:strURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            

            UBLog(@">>>>>>DELETE>>net work success>>>>responseObject: %@",responseObject);
            [self removeMBView];
            success(responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            [self removeMBView];
            UBLog(@">>>>>>DELETE>>net work failed>>>>responseObject: %@,error: %@", operation.responseObject, error);
            [self errorAction:error operation:operation];
            failure(error);
            
        }];
        break;
        
    }
            default:
            break;
    }
    
}
-(void)errorAction:(NSError *)error operation:(AFHTTPRequestOperation *)operation
{
    if([error.userInfo[AFNetworkingOperationFailingURLResponseErrorKey] statusCode] == 401){
        
        AppDelegate *appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [appDel presentLoginPage];
        
    }else if([error.userInfo[AFNetworkingOperationFailingURLResponseErrorKey] statusCode] == 500){
        
        [self errorMessage:@"服务器内部错误"];
        
    }else if([error.localizedDescription isEqualToString:@"请求超时。"]){
        
        [self errorMessage:@"请求超时"];
        
    }else if([error.userInfo[AFNetworkingOperationFailingURLResponseErrorKey] statusCode] == 502){
        
        [self errorMessage:@"服务器正在维护"];
        
    }else if([error.userInfo[AFNetworkingOperationFailingURLResponseErrorKey] statusCode] == 404){
        
        [self errorMessage:@"找不到资源"];
        
    }else{
        

        
    }
    
    NSDictionary *errDict = operation.responseObject;
    if (errDict) {
        [self errorMessage:[errDict objectForKey:@"desc"]];
    }
    
}
-(void)removeMBView
{
    if ([UIApplication sharedApplication].keyWindow.rootViewController.view) {
           [[[UIApplication sharedApplication].keyWindow.rootViewController.view viewWithTag:11] removeFromSuperview];
    }
 
}
- (BOOL)beforeExecute:(AFHTTPRequestOperationManager*)manager {
    
    NSOperationQueue *operationQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
    
    return TRUE;
}

-(void)errorMessage:(NSString *)error{
    
    UIAlertView *errorAlertView =[[UIAlertView alloc] initWithTitle:@"温馨提示" message:error delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [errorAlertView show];
    
}
-(NSString*)converseToJson:(NSMutableDictionary*)dictionary{
    NSError *error = nil;
    //NSJSONWritingPrettyPrinted:指定生成的JSON数据应使用空格旨在使输出更加可读。如果这个选项是没有设置,最紧凑的可能生成JSON表示。
    NSData *jsonData = [NSJSONSerialization
                        dataWithJSONObject:dictionary options:0 error:&error];
    if ([jsonData length] > 0 && error == nil){
        //UBLog(@"Successfully serialized the dictionary into data.");
        //NSData转换为String
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        //UBLog(@"JSON String = %@", jsonString);
        
        return jsonString;
    }
    else if ([jsonData length] == 0 &&
             error == nil){
        //UBLog(@"No data was returned after serialization.");
        
        return nil;
    }
    else if (error != nil){
        // UBLog(@"An error happened = %@", error);
        
        return nil;
    }else{
        return nil;
    }
}

@end
