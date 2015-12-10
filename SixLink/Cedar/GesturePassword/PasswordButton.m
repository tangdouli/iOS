//
//  PasswordButton.m
//  Gesture
//
//  Created by 袁斌 on 15/11/6.
//  Copyright © 2015年 yinbanke. All rights reserved.
//

#import "PasswordButton.h"

@implementation PasswordButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self test];
    
}
-(void)test
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect bounds = self.bounds;
    if (_selected) {//在画的时候
        if (_success) {//验证成功的
//            CGContextSetRGBStrokeColor(context, 2/255.f, 174/255.f, 240/255.f,1);//线条颜色
            CGContextSetRGBStrokeColor(context, 0.761, 0.780,0.788,1);//线条颜色
//            CGContextSetRGBFillColor(context,2/255.f, 174/255.f, 240/255.f,1);

            CGContextSetRGBFillColor(context, 0.145, 0.710,0.686,1);//线条颜色
        }
        else {//验证失败
            CGContextSetRGBStrokeColor(context, 208/255.f, 36/255.f, 36/255.f,1);//线条颜色
            CGContextSetRGBFillColor(context,208/255.f, 36/255.f, 36/255.f,1);
        }
        CGRect frame = CGRectMake(bounds.size.width/2-bounds.size.width/8+1, bounds.size.height/2-bounds.size.height/8, bounds.size.width/4, bounds.size.height/4);
        
        CGContextAddEllipseInRect(context,frame);
        CGContextFillPath(context);
    }
    else{
//        CGContextSetRGBStrokeColor(context, 1, 1,1,1);//线条颜色
        CGContextSetRGBStrokeColor(context, 0.761, 0.780,0.788,1);//线条颜色

    }
    
    CGContextSetLineWidth(context,2);
    CGRect frame = CGRectMake(2, 2, bounds.size.width-3, bounds.size.height-3);
    CGContextAddEllipseInRect(context,frame);
    CGContextStrokePath(context);
    if (_success) {
        CGContextSetRGBFillColor(context,30/255.f, 175/255.f, 235/255.f,0.15);
//        CGContextSetRGBFillColor(context, 1, 1,1,0);//线条颜色
    }
    else {
        CGContextSetRGBFillColor(context,208/255.f, 36/255.f, 36/255.f,0.3);
    }
    CGContextAddEllipseInRect(context,frame);
    if (_selected) {
        CGContextFillPath(context);
    }
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}
-(void)angle
{
//    CGMutablePathRef path = CGPathCreateMutable();
    
    CGFloat R = self.bounds.size.width;
    
    CGFloat r = 0.5*R;
    CGContextRef content = UIGraphicsGetCurrentContext();

//    CGPathMoveToPoint(path, NULL, r, 0);
//    CGPathAddLineToPoint(path, NULL, r*(1+sin(kAngleCount(60))), 0.5*r);
//    CGPathAddLineToPoint(path, NULL, r*(1+sin(kAngleCount(60))), 0.75*R);
//    CGPathAddLineToPoint(path, NULL, r, R);
//    CGPathAddLineToPoint(path, NULL, r*(1-sin(kAngleCount(60))), 0.75*R);
//    CGPathAddLineToPoint(path, NULL, r*(1-sin(kAngleCount(60))), 0.5*r);
//    CGPathAddLineToPoint(path, NULL, r, 0);
    
    CGContextMoveToPoint(content, r, 0);
    CGContextAddLineToPoint(content, r*(1+sin(kAngleCount(60))), 0.5*r);
    CGContextAddLineToPoint(content, r*(1+sin(kAngleCount(60))), 0.75*R);
    CGContextAddLineToPoint(content, r, R);
    CGContextAddLineToPoint(content, r*(1-sin(kAngleCount(60))), 0.75*R);
    CGContextAddLineToPoint(content, r*(1-sin(kAngleCount(60))), 0.5*r);
    CGContextAddLineToPoint(content, r, 0);
    
    
    CGContextClosePath(content);
    
    CGContextClip(content);
    
    UIImage *image = [UIImage imageNamed:@"180.png"];
//    UIImage *img = [self imageCompressForWidth:image targetWidth:R];
    
//    [img drawAtPoint:CGPointMake(0, 0)];
    
//    CGContextAddPath(content, path);
    
//    
//    if (_selected) {
//        if (_success) {//2/255.f, 174/255.f, 240/255.f,1
//            [UIColor colorWithRed:2/255.f green:174/255.f blue:240/255.f alpha:1];
//            CGContextDrawPath(content, kCGPathFillStroke);
//            
//        }else{
//            //208/255.f, 36/255.f, 36/255.f
//            [[UIColor colorWithRed:208/255.f green:36/255.f blue:36/255.f alpha:1] set];
//            CGContextDrawPath(content, kCGPathFillStroke);
//            
//        }
//    }else{
//        //1, 0.5,0.3
//        [[UIColor colorWithRed:1 green:0.5 blue:0.3 alpha:1] setStroke];
//        CGContextDrawPath(content, kCGPathStroke);
//    }
//    
//    CGContextSetLineWidth(content,1.2);
//    R = self.bounds.size.width-0.6;
//    r = 0.5*R;
//    
//    CGPathMoveToPoint(path, NULL, 0.6+r, 0+0.6);
//    CGPathAddLineToPoint(path, NULL, r*(1+sin(kAngleCount(60))), 0.5*r);
//    CGPathAddLineToPoint(path, NULL, r*(1+sin(kAngleCount(60))), 0.75*R);
//    CGPathAddLineToPoint(path, NULL, r, R);
//    CGPathAddLineToPoint(path, NULL, r*(1-sin(kAngleCount(60)))+0.6, 0.75*R);
//    CGPathAddLineToPoint(path, NULL, r*(1-sin(kAngleCount(60)))+0.6, 0.5*r);
//    CGPathAddLineToPoint(path, NULL, r+0.6, 0+0.6);
//    CGContextAddPath(content, path);
//    if (_success) {
//        [[UIColor colorWithRed:1 green:0.5 blue:0.3 alpha:1] setStroke];
//        CGContextDrawPath(content, kCGPathStroke);
//    }
//    else {
//        [[UIColor colorWithRed:4/255.f green:36/255.f blue:36/255.f alpha:1] set];
//        CGContextDrawPath(content, kCGPathStroke);
//    }
//    if (_selected) {
//        
//        [[UIColor colorWithRed:0.5 green:0.5 blue:0.3 alpha:1] setStroke];
//        CGContextDrawPath(content, kCGPathStroke);
//    }
//    
//    CGPathRelease(path);
    

}

@end
