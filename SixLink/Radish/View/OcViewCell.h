//
//  OcViewCell.h
//  SixLink
//
//  Created by 萝卜 on 15/11/9.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGTableView.h"
#import "MessageModel.h"
@interface OcViewCell : UITableViewCell<JGTableViewTransfromProtocol>

@property(nonatomic,assign)CGFloat miniumScale;;
@property (weak, nonatomic) IBOutlet UIView *scaleView;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
//-(void)transformCell:(CGFloat)scale;
@property (weak, nonatomic) IBOutlet UILabel *imgUpL;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;

@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (weak, nonatomic) IBOutlet UILabel *nameL;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgConstraint;

@property (nonatomic) CGFloat oldWidthLayoutConstraint;

-(void)makeCellValue:(MessageModel *)item;

@end
