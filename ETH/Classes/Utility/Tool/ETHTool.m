//
//  ETHTool.m
//  ZF
//
//  Created by apple on 2018/12/30.
//  Copyright © 2018 LS. All rights reserved.
//

#import "ETHTool.h"
#import "SDWebImageManager.h"
#import <DateTools.h>


@implementation ETHTool

/**
 *  是否是邮箱
 *
 *  @param email email description
 *
 *  @return <#return value description#>
 */
+ (BOOL) isEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
}

/**
 *  手机号码判断
 *
 *  @return <#return value description#>
 */
+ (BOOL) isPhoneNumber:(NSString *)PhoneNumber
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:PhoneNumber];
}

/**
 *  将一个带有分隔符的字符串拆分成数组
 *
 *  @param strData     带有分隔符的字符串
 *  @param strSeparator     分隔符
 *  @return NSMutableArray 拆分后的数组
 */
+(NSMutableArray *)strToArr: (NSString*)strData Separator:(NSString*)strSeparator
{
    NSMutableArray * arr = [[NSMutableArray alloc]initWithArray:[strData componentsSeparatedByString:strSeparator]];
    
    return arr;
}

/**
 *  将一个数组拆分组成带有分隔符的字符串
 *
 *  @param NSMutableArray 拆分的数组
 *  @param strSeparator     分隔符
 *  @return strData     带有分隔符的字符串
 */
+(NSString *)ArrTostr: (NSMutableArray*)arrData Separator:(NSString*)strSeparator
{
    NSString *str = nil;
    if (arrData==nil)
    {
        return str;
    }
    
    str = [arrData componentsJoinedByString:strSeparator];
    return str;
}


//时间戳转日期
+ (NSDate*)UnixTimeToDate:(long long)lTime
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:lTime];
    return date;
}

//获取时间显示字符串
+ (NSString*)dateTimeAgoText:(NSString*)datelineString
{
    if (kStringIsEmpty(datelineString))
    {
        return nil;
    }
    
    NSDate* date = [ETHTool UnixTimeToDate:datelineString.longLongValue];
    return date.timeAgoSinceNow;
}

//字符串转时间
+(NSDate *)nsstringConversionNSDate:(NSString *)dateStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *datestr = [dateFormatter dateFromString:dateStr];
    return datestr;
}

//时间转时间戳
+(NSString *)dateConversionTimeStamp:(NSDate *)date
{
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    return timeSp;
}

/**
 *  获取时间差值  截止时间-当前时间
 *  nowDateStr : 当前时间
 *  deadlineStr : 截止时间
 *  @return 时间戳差值
 */
+ (NSInteger)getDateDifferenceWithNowDateStr:(NSString*)nowDateStr deadlineStr:(NSString*)deadlineStr {
    
    NSInteger timeDifference = 0;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yy-MM-dd HH:mm"];
    NSDate *nowDate = [formatter dateFromString:nowDateStr];
    NSDate *deadline = [formatter dateFromString:deadlineStr];
    NSTimeInterval oldTime = [nowDate timeIntervalSince1970];
    NSTimeInterval newTime = [deadline timeIntervalSince1970];
    timeDifference = newTime - oldTime;
    
    return timeDifference;
}

//获取当前时间戳
+(NSString*)UnixTimeString
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0]; // 获取当前时间0秒后的时间
    NSTimeInterval time = [date timeIntervalSince1970];// *1000 是精确到毫秒(13位),不乘就是精确到秒(10位)
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}


//将图片字符串转换为URL
+(NSURL *)IconStringToUrl:(NSString*)iconString
{
    if (kStringIsEmpty(iconString))
    {
        return nil;
    }
    
    NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,iconString];
    return [NSURL URLWithString:str];
}

//颜色转图片
+(UIImage*)Color2Image:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}


//得到缓存大小
+(NSUInteger)getCacheSize
{
    SDImageCache * cache = [SDImageCache sharedImageCache];
    NSUInteger size = [cache getSize];
    return size;
}

/**
 清除app缓存
 */
+(void)clearAppCache
{
    SDImageCache * cache = [SDImageCache sharedImageCache];
    [cache clearDiskOnCompletion:nil];
    [cache clearMemory];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    //错误信息
    NSError *error;
    
    //清空tmp目录
    NSString* path = [ETHTool GetAppTmpPath];
    [fileMgr removeItemAtPath:path error:&error];
}

//DocumentDirectory
+(NSString*)GetAppDocPath
{
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return doc;
}

/**
 *  得到app的家目录下tmp目录路径，在应用退出后清空。
 *
 *  @return <#return value description#>
 */
+(NSString*)GetAppTmpPath
{
    NSString *strTmpPath = NSTemporaryDirectory();
    
    return strTmpPath;
}


//隐藏线
+(void)isHiddenNavigationBarSeparatorLine:(BOOL)hide vc:(UIViewController*)viewController
{
    if ([viewController.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        NSArray *list=viewController.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIView class]]) {
                UIView *imageView=(UIView *)obj;
                NSArray *list2=imageView.subviews;
                for (id obj2 in list2) {
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        UIImageView *imageView2=(UIImageView *)obj2;
                        if (hide)
                        {
                            imageView2.hidden = imageView2.bounds.size.height < 1;
                        }
                        else
                        {
                            imageView2.hidden = NO;
                        }
                    }
                }
            }
        }
    }
}


/**
 *  创建关键字高亮字体颜色的富文本字符串
 *
 *  @param AttributedString 原富文本
 *  @param strText          原富文本的内容
 *  @param strKeyWord       关键字
 *  @param Color            关键字颜色
 *  @param font             关键字字体
 *  @param BGColor          关键字背景颜色
 *
 *  @return 富文本
 */
+(NSMutableAttributedString*)GetAttributedString:(NSMutableAttributedString*)AttributedString SrcText:(NSString*)strText KeyWord:(NSString*)strKeyWord KeyWordColor:(UIColor*)Color KeyWordFont:(UIFont*)font KeyWordBGolor:(UIColor*)BGColor
{
    //判断字键字
    if ( !strText || !strKeyWord )
    {
        return nil;
    }
    
    //如果默为为nil就需要创建
    if (!AttributedString)
    {
        AttributedString = [[NSMutableAttributedString alloc] initWithString:strText];
    }
    
    //关键字为空字符串
    if ( [strKeyWord isEqualToString:@""] )
    {
        return AttributedString;
    }
    
    NSRange range = [strText rangeOfString:strKeyWord];
    if (range.location == NSNotFound)
    {
        return AttributedString;
    }
    
    //颜色、字体和背景颜色
    if (Color)
    {
        [AttributedString addAttributes:@{NSForegroundColorAttributeName:Color}
                                  range:range];
    }
    
    if (font)
    {
        [AttributedString addAttributes:@{NSFontAttributeName:font}
                                  range:range];
    }
    
    if (BGColor)
    {
        [AttributedString addAttributes:@{NSBackgroundColorAttributeName:BGColor}
                                  range:range];
    }
    
    return AttributedString;
}


@end
