//
//  OcViewCell.m
//  SixLink
//
//  Created by 萝卜 on 15/11/9.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "OcViewCell.h"
#import "MessageModel.h"
#import "UIImageView+WebCache.h"
@implementation OcViewCell

- (void)awakeFromNib {
    // Initialization code
    self.headImg.layer.cornerRadius=13;
    self.headImg.layer.masksToBounds=YES;
    _miniumScale = 0.8;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [self addObserver:self forKeyPath:@"imgViewWidthLayoutConstraint" options:NSKeyValueObservingOptionInitial context:NULL];
        
    }
    return self;
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"imgViewWidthLayoutConstraint"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"imgViewWidthLayoutConstraint"]) {
        _oldWidthLayoutConstraint = _imgConstraint.constant;
    }
}

#pragma mark - JGTableViewTransfromProtocol
- (CGFloat)JGTableViewMinumScal {
    return 0.8;
}
- (void)JGTableViewTransfromCellForScale:(CGFloat)scale {
    
    self.scaleView.transform = CGAffineTransformMakeScale(1.0 - scale, 1.0 - scale);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)makeCellValue:(MessageModel *)item{
    //[self.photoImageView sd_setImageWithURL:[NSURL URLWithString:item.imgUrl ]];
    self.imgUpL.text=item.content;
    self.nameL.text =item.name;
}

@end
