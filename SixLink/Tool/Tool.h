//
//  Tool.h
//  QX
//
//  Created by default_Yuan on 14-4-22.
//  Copyright (c) 2014年 huanhuba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tool : NSObject

+(UIColor *)rgbToUIcolor:(NSString*)rgb;

//十六进制返回RGB颜色
+(UIColor *) hexStringToColor: (NSString *) stringToConvert;

+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

+ (NSString *) hexFromUIColor: (UIColor*) color;

//判断输入内容为数字或字母
+(NSString *) utf8ToUnicode:(NSString *)string;

//判定身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard;

//资金以,三位分割
+(NSString *)CountNumAndChangeformat:(NSString *)num;

//将图片转成base64
+(NSString *)base64Str:(UIImage *)image;

//图片旋转90度
+(UIImage *)fixOrientation:(UIImage *)aImage;

//图片的缩放
+(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;

//图片缩放到那种程度
+(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

//判断手机号
+(BOOL)regexPhoneWithString:(NSString*)newString;

//将字典转成json字符串
+(NSString *)jsonStringWithDictionary:(NSDictionary *)dictionary;

//时间转化到 时：分：秒
+(NSString*)jsonDateStringToString:(NSString*)jsonStr;

//时间转化到 年：月：日
+(NSString *)makeTime:(NSString *)timeStr;

//des加密
+ (NSString *)desStringFromText:(NSString *)text;

//文字富文本
+(NSMutableAttributedString *)setOriginallyTitle:(NSString *)ogytitle andFirstTextColor:(UIColor *)firstColor andLastText:(UIColor *)lastColor andTextFont:(UIFont *)textFont andTextLeng:(NSInteger )textValue;
//提示框
+(void)showAlter:(NSString *)message andControl:(UIViewController*)Controller;
//判断密码是否为数字字母组合
+(BOOL)judgePassWordLegal:(NSString *)pass;
+ (UIImage *)imageWithColor:(UIColor *)color;
@end
