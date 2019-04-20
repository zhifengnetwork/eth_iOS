//
//  ETHDefinitePurchaseVC.m
//  ETH
//
//  Created by admin on 2019/4/9.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHDefinitePurchaseVC.h"
#import "ETHCurrentInvestmentTableCell.h"
#import "ETHInvestmentPurchaseTableCell.h"
#import "ETHQRCodeTableCell.h"
#import "ETHReceiptAddressTableCell.h"
#import "ETHPaymentTableCell.h"
#import "http_user.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "ETHTZModel.h"
#import "TZImagePickerController.h"


@interface ETHDefinitePurchaseVC ()<ETHInvestmentPurchaseTableCellDelegate,ETHQRCodeTableCellDelegate>

@end

@implementation ETHDefinitePurchaseVC

static NSString *const ETHCurrentInvestmentTableCellID = @"ETHCurrentInvestmentTableCellID";
static NSString *const ETHInvestmentPurchaseTableCellID = @"ETHInvestmentPurchaseTableCellID";
static NSString *const ETHQRCodeTableCellID = @"ETHQRCodeTableCellID";
static NSString *const ETHReceiptAddressTableCellID = @"ETHReceiptAddressTableCellID";
static NSString *const ETHPaymentTableCellID = @"ETHPaymentTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"投资购买";
    [self setupTableView];
}

-(void)loadData
{
    if (kStringIsEmpty(self.tz.list.creditmy))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入追加投资金额"];
        return;
    }
    
    if (kStringIsEmpty(self.tz.list.zfurl))
    {
        [SVProgressHUD showInfoWithStatus:@"请上传支付凭证"];
        return;
    }
    
    ZWeakSelf
    [SVProgressHUD showWithStatus:@"正在加载"];
    [http_user wechat_complete1:self.tz.list.creditmy.integerValue url:self.tz.list.zfurl success:^(id responseObject)
     {
         [weakSelf showData:responseObject];
     } failure:^(NSError *error)
     {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)showData:(id)responseObject
{
    [SVProgressHUD showSuccessWithStatus:@"购买成功"];
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)deleteButtonDidClick
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAippear:(BOOL)animated{
    
    [super viewWillAppear:animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)setupTableView
{
    self.view.backgroundColor = RGBColorHex(0xffffff);
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.backgroundColor = RGBColorHex(0xffffff);
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [self.tableView registerClass:[ETHCurrentInvestmentTableCell class] forCellReuseIdentifier:ETHCurrentInvestmentTableCellID];
    [self.tableView registerClass:[ETHInvestmentPurchaseTableCell class] forCellReuseIdentifier:ETHInvestmentPurchaseTableCellID];
    [self.tableView registerClass:[ETHQRCodeTableCell class] forCellReuseIdentifier:ETHQRCodeTableCellID];
    [self.tableView registerClass:[ETHReceiptAddressTableCell class] forCellReuseIdentifier:ETHReceiptAddressTableCellID];
    [self.tableView registerClass:[ETHPaymentTableCell class] forCellReuseIdentifier:ETHPaymentTableCellID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    ETHCurrentInvestmentTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ETHCurrentInvestmentTableCellID];
    scell = [[ETHCurrentInvestmentTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHCurrentInvestmentTableCellID];
    scell.isLeftName = YES;
    
    if (indexPath.section==0)
    {
        scell.title = @"当前投资额：";
        scell.name = self.tz.list.credit1;
        
        cell = scell;
    }
    else if (indexPath.section==1)
    {
         ETHInvestmentPurchaseTableCell* ocell = [tableView dequeueReusableCellWithIdentifier:ETHInvestmentPurchaseTableCellID];
        ocell = [[ ETHInvestmentPurchaseTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: ETHInvestmentPurchaseTableCellID];
        ocell.indexPath = indexPath;
        ocell.delegate = self;
        ocell.title = @"追加投资：";
        
        cell = ocell;
    }
    else if (indexPath.section==2)
    {
        scell.title = @"账户投资上限：";
        scell.name = self.tz.list.bibi;
        
        cell = scell;
    }
    else if (indexPath.section==3)
    {
        scell.title = @"当前最多可投资：";
        scell.name = [NSString stringWithFormat:@"%f",self.tz.list.bibi.floatValue - self.tz.list.credit1.floatValue];
        
        cell = scell;
    }
    else if (indexPath.section==4)
    {
        ETHQRCodeTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ETHQRCodeTableCellID];
        pcell = [[ETHQRCodeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHQRCodeTableCellID];
        pcell.title = @"二维码";
        pcell.isClick = NO;
        cell = pcell;
    }
    else if (indexPath.section==5)
    {
        ETHReceiptAddressTableCell* kcell = [tableView dequeueReusableCellWithIdentifier:ETHReceiptAddressTableCellID];
        kcell = [[ETHReceiptAddressTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHReceiptAddressTableCellID];
        
        cell = kcell;
    }
    else if (indexPath.section==6)
    {
        ETHQRCodeTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ETHQRCodeTableCellID];
        pcell = [[ETHQRCodeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHQRCodeTableCellID];
        pcell.title = @"支付凭证";
        pcell.delegate = self;
        cell = pcell;
    }
    else if (indexPath.section==7)
    {
        ETHPaymentTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ETHPaymentTableCellID];
        pcell = [[ETHPaymentTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHPaymentTableCellID];
        pcell.title = @"确定购买";
        
        cell = pcell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==4 || indexPath.section==6)
    {
        return 125;
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

#pragma mark - TableViewDelegate
//点击了哪个cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==7)
    {
        [self loadData];
    }
}

//正在输入中
-(void)ETHInvestmentPurchaseTableCellInputing:(NSString*)text indexPath:(NSIndexPath*)indexPath
{
    self.tz.list.creditmy = text;
    NSLog(@"%@",text);
}

- (void)ETHQRCodeTableCellDidClick
{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    ZWeakSelf
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto)
    {
        [weakSelf uploadImage:[photos firstObject]];
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

-(void)uploadImage:(UIImage*)image
{
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0f);
    //NSDataBase64EncodingEndLineWithLineFeed这个枚举值是base64串不换行
    NSString *imageBase64Str = [imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
//    //不转base64
//    NSString * str =[[NSString alloc] initWithData:imageData encoding:NSUTF8StringEncoding];
    
    ZWeakSelf
    [http_user uploader:imageBase64Str success:^(id responseObject)
     {
         [weakSelf uploadImage_ok:responseObject];
     } failure:^(NSError *error)
     {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)uploadImage_ok:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.tz.list.zfurl = [responseObject objectForKey:@"img"];
    [SVProgressHUD showSuccessWithStatus:@"上传成功"];
}


@end
