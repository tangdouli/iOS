//
//  DesUtility.h
//  SilverBC
//
//  Created by 吉在成 on 15/7/28.
//  Copyright (c) 2015年 吉在成. All rights reserved.
//

#import <Foundation/Foundation.h>

#define __BASE64( text )        [Base64codeFunc base64StringFromText:text]


@interface DesUtility : NSObject


+ (NSString *)desStringFromText:(NSString *)text;

@end
