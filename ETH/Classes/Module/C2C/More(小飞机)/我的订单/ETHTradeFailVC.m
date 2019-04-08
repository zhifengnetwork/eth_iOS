
//
//  ETHTradeFailVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/8.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTradeFailVC.h"

@interface ETHTradeFailVC ()

@end

@implementation ETHTradeFailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
}
- (void)backClick{
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController popViewControllerAnimated:YES];
}
@end
