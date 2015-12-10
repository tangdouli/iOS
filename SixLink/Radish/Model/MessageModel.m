//
//  MessageModel.m
//  SixLink
//
//  Created by 萝卜 on 15/11/9.
//  Copyright © 2015年 Ubankers. All rights reserved.
//
#import "MessageModel.h"

@implementation MessageModel
+(MessageModel *)makeMessageDict:(NSDictionary *)ModelDict{
    MessageModel *model =[[MessageModel alloc]init];
    
    model.imgUrl =[ModelDict objectForKey:@"icon"];
    
    model.content =[ModelDict objectForKey:@"content"];
    model.time=[ModelDict objectForKey:@"time"];
    model.name =[ModelDict objectForKey:@"name"];
    return  model;
}
@end
