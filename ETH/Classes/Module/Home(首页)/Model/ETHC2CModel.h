//
//  ETHC2CModel.h
//  ETH
//
//  Created by weiming zhang on 2019/4/19.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ETHC2CModel : NSObject
@property (nonatomic , copy) NSString              *type;
@property (nonatomic , copy) NSString              *ID;
@property (nonatomic , copy) NSString              *openid;
@property (nonatomic , copy) NSString              *openid2;
@property (nonatomic , copy) NSString              *price;
@property (nonatomic , copy) NSString              *trx;
@property (nonatomic , copy) NSString              *trx2;
@property (nonatomic , copy) NSString              *money;
@property (nonatomic , copy) NSString              *status;
@property (nonatomic , copy) NSString              *createtime;
@property (nonatomic , copy) NSString              *zfbfile;
@property (nonatomic , copy) NSString              *wxfile;

@property (nonatomic , copy) NSString              *order_id;
@property (nonatomic , copy) NSString              *textarea;
@property (nonatomic , copy) NSString              *text;
@property (nonatomic , copy) NSString              *file;
@property (nonatomic , copy) NSString              *type1;
@property (nonatomic , copy) NSString              *stuas;
@property (nonatomic , copy) NSString              *files;

@property (nonatomic , copy) NSString              *bankid;
@property (nonatomic , copy) NSString              *bankid2;
@property (nonatomic , copy) NSString              *bank;
@property (nonatomic , copy) NSString              *bank2;
@property (nonatomic , copy) NSString              *nickname;
@property (nonatomic , copy) NSString              *nickname2;
@property (nonatomic , copy) NSString              *mine;
@property (nonatomic , copy) NSString              *self3;
@property (nonatomic , copy) NSString              *total;
@property (nonatomic , copy) NSString              *pagesize;
@property (nonatomic , copy) NSString              *datatime;
@property (nonatomic , copy) NSString              *endtime;
@property (nonatomic , copy) NSString              *apple_time;

@property (nonatomic , copy) NSString              *mobile;
@property (nonatomic , copy) NSString              *bankname;
@property (nonatomic , copy) NSString              *bankname2;
@property (nonatomic , copy) NSString              *mobile2;
@property (nonatomic , copy) NSString              *type_own;
@property (nonatomic , copy) NSString              *name;
@property (nonatomic , copy) NSString              *img;
@property (nonatomic , copy) NSString              *trxprice;
@property (nonatomic , copy) NSString              *trxsxf;
@end
@interface ETHDetailModel : NSObject
@property (nonatomic , strong)ETHC2CModel              *list;
@property (nonatomic , assign)NSInteger              type_own;
@end

@interface ETHC2CListModel : BaseListModel
@end

NS_ASSUME_NONNULL_END
