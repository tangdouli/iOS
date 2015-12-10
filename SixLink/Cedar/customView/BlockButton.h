//
//  BlockButton.h
//  SixLink
//
//  Created by 袁斌 on 15/11/10.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlockButton;

typedef void (^blockAction)(BlockButton *sender);

@interface BlockButton : UIButton

@property(copy,nonatomic)blockAction blockAction;

@end
