//
//  ConsumerCell.m
//  SixLink
//
//  Created by 袁斌 on 15/11/27.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "ConsumerCell.h"

@interface ConsumerCell ()
@property (weak, nonatomic) IBOutlet UILabel *catAll;

@end

@implementation ConsumerCell

- (void)awakeFromNib {
    // Initialization code
    _catAll.clipsToBounds = YES;
    _catAll.layer.borderColor = [[UIColor whiteColor] CGColor];
    _catAll.layer.borderWidth = 0.65;
    _catAll.layer.cornerRadius = 1.5;
}

@end
