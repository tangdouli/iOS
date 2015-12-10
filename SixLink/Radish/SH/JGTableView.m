//
//  JGTableView.m
//  SixLink
//
//  Created by 萝卜 on 15/11/9.
//  Copyright © 2015年 Ubankers. All rights reserved.
//
#import "JGTableView.h"

@implementation JGTableView

- (void)layoutSubviews {
    [super layoutSubviews];
    [self transformForCell];
}
- (void)transformForCell {
    
    for (NSIndexPath *indexPath in self.indexPathsForVisibleRows) {
        
        id<JGTableViewTransfromProtocol> cell = (id)[self cellForRowAtIndexPath:indexPath];
        
        if ([cell respondsToSelector:@selector(JGTableViewMinumScal)]
          && [cell respondsToSelector:@selector(JGTableViewTransfromCellForScale:)]) {
            
            CGFloat distanceFromCenter = [self computeDistanceFromCenter:indexPath];
            
            [cell JGTableViewTransfromCellForScale:[self computeScale:distanceFromCenter minScale:[cell JGTableViewMinumScal]]];
            
        }
    }
    
}

- (CGFloat)computeDistanceFromCenter:(NSIndexPath *)indexPath {
   
    CGRect cellRect = [self rectForRowAtIndexPath:indexPath];
    
    CGFloat cellCenter = cellRect.origin.y + cellRect.size.height/2;
    
    CGFloat contentCenter = self.contentOffset.y + self.bounds.size.height/2;
    
    return fabs(cellCenter - contentCenter);

}


- (CGFloat)computeScale:(CGFloat)distanceFromCenter minScale:(CGFloat)minScale {
   
    return  (1.0 - minScale) * distanceFromCenter / self.bounds.size.height;

}



@end
