//
//  MessageModel.h
//  SixLink
//
//  Created by 萝卜 on 15/11/9.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject
@property(strong,nonatomic)NSString *imgUrl;
@property(strong,nonatomic)NSString *time;
@property(strong,nonatomic)NSString *content;
@property(strong,nonatomic)NSString *name;
+(MessageModel *)makeMessageDict:(NSDictionary *)ModelDict;
@end
