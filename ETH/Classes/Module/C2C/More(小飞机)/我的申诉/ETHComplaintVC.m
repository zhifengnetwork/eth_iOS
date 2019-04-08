//
//  ETHComplaintVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/5.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHComplaintVC.h"
#import "ETHTitleView.h"

@interface ETHComplaintVC ()
@property (nonatomic, strong)ETHTitleView *titleView;
@property (nonatomic, strong)UIImageView *backImg;
@end

@implementation ETHComplaintVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.backImg];
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(LL_StatusBarAndNavigationBarHeight +55);
    }];
    [_backImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).with.offset(-60);
        make.left.right.bottom.equalTo(self.view);
    }];
    
}
- (UIView *)titleView{
    if (_titleView == nil) {
        _titleView = [[ETHTitleView alloc]init];
        [_titleView hideRightBtn:YES];
    }
    return _titleView;
}
- (UIImageView *)backImg{
    if (_backImg == nil) {
        _backImg = [[UIImageView alloc]init];
        self.backImg.image = [UIImage imageNamed:@"BG-R"];
    }
    return _backImg;
}
@end
