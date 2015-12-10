//
//  SixAngleIcon.m
//  SixLink
//
//  Created by 袁斌 on 15/11/13.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "SixAngleIcon.h"
#import "UIImage+MultiFormat.h"
@interface SixAngleIcon ()
{
    NSString *_urlStr;
}
@end

@implementation SixAngleIcon

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
-(void)sd_setIconWithUrlStr:(NSString *)urlStr
{
    _urlStr = urlStr;
    [self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGFloat R = self.bounds.size.width;
    
    CGFloat r = 0.5*R;
    CGContextRef content = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(content, r, 0);
    CGContextAddLineToPoint(content, r*(1+sin(kAngleCount(60))), 0.5*r);
    CGContextAddLineToPoint(content, r*(1+sin(kAngleCount(60))), 0.75*R);
    CGContextAddLineToPoint(content, r, R);
    CGContextAddLineToPoint(content, r*(1-sin(kAngleCount(60))), 0.75*R);
    CGContextAddLineToPoint(content, r*(1-sin(kAngleCount(60))), 0.5*r);
    CGContextAddLineToPoint(content, r, 0);
    
    
    CGContextClosePath(content);
    CGContextClip(content);
    
//    NSURL *url = [NSURL URLWithString:_urlStr];
//    NSData *iconData = [NSData dataWithContentsOfURL:url];
//    UIImage *image = [UIImage sd_imageWithData:iconData];
    UIImage *image = [UIImage imageNamed:@"IMG_0653.JPG"];
    UIImage *img = [self imageCompressForWidth:image targetWidth:R];
    
    [img drawAtPoint:CGPointMake(0, 0)];

}
//图片缩放
-(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth
{
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = (targetWidth / width) * height;
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [sourceImage drawInRect:CGRectMake(0,0,targetWidth,  targetHeight)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
