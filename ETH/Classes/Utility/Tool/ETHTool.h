//
//  ETHTool.h
//  ZF
//
//  Created by apple on 2018/12/30.
//  Copyright © 2018 LS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 通用工具类
 */
@interface ETHTool : NSObject

/**
 *  是否是邮箱
 *
 *  @param email <#email description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL) isEmail:(NSString *)email;

/**
 *  手机号码判断
 *
 *  @return <#return value description#>
 */
+ (BOOL) isPhoneNumber:(NSString *)PhoneNumber;

/**
 *  将一个带有分隔符的字符串拆分成数组
 *
 *  @param strData     带有分隔符的字符串
 *  @param strSeparator     分隔符
 *  @return NSMutableArray 拆分后的数组
 */
+(NSMutableArray *)strToArr: (NSString*)strData Separator:(NSString*)strSeparator;

/**
 *  将一个数组拆分组成带有分隔符的字符串
 *
 *  @param NSMutableArray 折分的数组
 *  @param strSeparator     分隔符
 *  @return strData     带有分隔符的字符串
 */

//日期格式化
+(NSDateFormatter *)dateFormatWith:(NSString *)formatStr;

//时间戳转日期
+ (NSDate*)UnixTimeToDate:(long long)lTime;

//获取时间显示字符串
+ (NSString*)dateTimeAgoText:(NSString*)datelineString;

//字符串转时间
+(NSDate *)nsstringConversionNSDate:(NSString *)dateStr;

//时间转时间戳
+(NSString *)dateConversionTimeStamp:(NSDate *)date;

/**
 *  获取时间差值  截止时间-当前时间
 *  nowDateStr : 当前时间
 *  deadlineStr : 截止时间
 *  @return 时间戳差值
 */
+ (NSInteger)getDateDifferenceWithNowDateStr:(NSString*)nowDateStr deadlineStr:(NSString*)deadlineStr;


//将图片字符串转换为URL
+(NSURL *)IconStringToUrl:(NSString*)iconString;

//颜色转图片
+(UIImage*)Color2Image:(UIColor*)color;

//得到缓存大小
+(NSUInteger)getCacheSize;

/**
 清除app缓存
 */
+(void)clearAppCache;

//DocumentDirectory
+(NSString*)GetAppDocPath;

/**
 *  得到app的家目录下tmp目录路径，在应用退出后清空。
 *
 *  @return <#return value description#>
 */
+(NSString*)GetAppTmpPath;

//隐藏线
+(void)isHiddenNavigationBarSeparatorLine:(BOOL)hide vc:(UIViewController*)viewController;

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
+(NSMutableAttributedString*)GetAttributedString:(NSMutableAttributedString*)AttributedString SrcText:(NSString*)strText KeyWord:(NSString*)strKeyWord KeyWordColor:(UIColor*)Color KeyWordFont:(UIFont*)font KeyWordBGolor:(UIColor*)BGColor;


@end

NS_ASSUME_NONNULL_END
