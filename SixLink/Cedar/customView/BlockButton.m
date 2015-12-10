//
//  BlockButton.m
//  SixLink
//
//  Created by 袁斌 on 15/11/10.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "BlockButton.h"

@interface BlockButton()

@end

@implementation BlockButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(blockAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(UIButtonType)buttonType
{
    return UIButtonTypeCustom;
}
-(void)blockAction:(id)sender
{
    _blockAction(self);
}

@end
