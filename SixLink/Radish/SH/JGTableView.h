//
//  JGTableView.h
//  SixLink
//
//  Created by 萝卜 on 15/11/9.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JGTableView : UITableView


@end

#pragma mark - tranfrom for cell
@protocol JGTableViewTransfromProtocol <NSObject>


- (CGFloat)JGTableViewMinumScal;

- (void)JGTableViewTransfromCellForScale:(CGFloat)forScale;


@end
