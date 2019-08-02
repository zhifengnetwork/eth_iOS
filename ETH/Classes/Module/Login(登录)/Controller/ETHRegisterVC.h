//
//  ETHRegisterVC.h
//  ZF
//
//  Created by apple on 2019/2/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 注册
 */

@interface ETHRegisterVC : UIViewController

//0:注册 1:找回密码
@property (nonatomic, strong) NSString *type;

@property (nonatomic, assign) BOOL isShowBgview;
@property (nonatomic, assign) BOOL isShowLabel;
@property (nonatomic, assign) BOOL isShowField;

@property (nonatomic, strong) NSString *titleBgview;

@end

NS_ASSUME_NONNULL_END
