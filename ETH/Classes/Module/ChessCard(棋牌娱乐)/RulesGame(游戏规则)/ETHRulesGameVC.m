//
//  ETHRulesGameVC.m
//  ETH
//
//  Created by apple on 2019/4/22.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHRulesGameVC.h"
#import "http_indexedit.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"


@interface ETHRulesGameVC ()

@property (nonatomic, strong)UIWebView *webView;

@end

@implementation ETHRulesGameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"游戏规则";
    [self.view addSubview:self.webView];
    [self loadData];
}


-(void)loadData
{
    ZWeakSelf
    //中奖记录
    [SVProgressHUD showWithStatus:@"正在加载"];
    [http_indexedit fucairule:^(id responseObject)
     {
         [SVProgressHUD dismiss];
         [weakSelf showData:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    NSString* str = responseObject;
    [self.webView loadHTMLString:str baseURL:nil];
}


-(UIWebView *)webView
{
    if (_webView==nil)
    {
        _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    }
    
    return _webView;
}

@end
