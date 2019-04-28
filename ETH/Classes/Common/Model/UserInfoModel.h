//
//  UserInfoModel.h
//  LS
//
//  Created by ZMac on 2018/11/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseListModel.h"

/**
 用户列表list model
 */
@interface UserInfoListModel : BaseListModel


@end

@interface LevelModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *levelname1;
@property (nonatomic, copy) NSString *levelname3;

@end

@interface MemberModel : NSObject<NSCoding>

//用户ID
@property (nonatomic, copy) NSString *userid;
//
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *openid;
@property (nonatomic, copy) NSString *url;
//手机号
@property (nonatomic, copy) NSString *mobile;

//用户头像
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *levelname1;
@property (nonatomic, copy) NSString *levelname3;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *credit1;

@property (nonatomic, copy) NSString *credit2;
@property (nonatomic, copy) NSString *credit3;
@property (nonatomic, copy) NSString *credit4;

@end

@interface Arr2Model : NSObject<NSCoding>

@property (nonatomic, copy) NSString *money;

@end

/**
 用户信息model
 */
@interface UserInfoModel : NSObject<NSCoding>

//用户ID
@property (nonatomic, copy) NSString *userid;
//
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *openid;

@property (nonatomic, strong) MemberModel *member;
@property (nonatomic, strong) LevelModel *huiyuanlevel;
@property (nonatomic, strong) Arr2Model *arr2;

@property (nonatomic, copy) NSString *money2;
@property (nonatomic, copy) NSString *money4;
@property (nonatomic, copy) NSString *arr;

@property (nonatomic, copy) NSString *adress;
@property (nonatomic, copy) NSString *walletcode;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *zfbfile;
@property (nonatomic, copy) NSString *wxfile;
@property (nonatomic, copy) NSString *bankid;
@property (nonatomic, copy) NSString *bankname;
@property (nonatomic, copy) NSString *bank;

//省
@property (nonatomic, copy) NSString *province;
//市
@property (nonatomic, copy) NSString *city;
//区
@property (nonatomic, copy) NSString *district;
//性别(1代表男 2代表女 0代表保密)
@property (nonatomic, assign) NSInteger sex;


//获取性别名称
-(NSString*)getSexText;

//获取用户信息(仅用于获取当前登录用户)
+(UserInfoModel*)readUserInfo;

//保存用户信息(仅用于当前登录用户)
-(void)saveUserInfo;

//删除用户信息
+(void)removeUserInfo;

@end
