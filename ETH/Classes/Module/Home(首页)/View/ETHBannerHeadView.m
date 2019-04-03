//
//  ETHBannerHeadView.m
//  ZF
//
//  Created by apple on 27/02/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ETHBannerHeadView.h"
#import <SDCycleScrollView.h>

@interface ETHBannerHeadView ()<SDCycleScrollViewDelegate>

/* 轮播图 */
@property (strong , nonatomic)SDCycleScrollView *cycleScrollView;

@property (strong , nonatomic) UIButton *shareButton;

@end

@implementation ETHBannerHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.backgroundColor = RGBMainColor;
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 100+64) delegate:self placeholderImage:nil];
    _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    _cycleScrollView.autoScrollTimeInterval = 3.0;
    
    [self addSubview:_cycleScrollView];
    [self addSubview:self.shareButton];
    
    [_shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_cycleScrollView.mas_right).offset(15);
        make.centerY.equalTo(self->_cycleScrollView);
        make.width.mas_equalTo(55);
        make.height.mas_equalTo(25);
    }];
}

- (void)setImageUrls:(NSArray *)imageUrls
{
    _imageUrls = imageUrls;
    _cycleScrollView.placeholderImage = [UIImage imageNamed:@"default_160"];
    if (_imageUrls.count == 0) return;
    _cycleScrollView.imageURLStringsGroup = _imageUrls;
    
}

- (void)shareButtonClick
{
    
}


-(UIButton*)shareButton
{
    if (_shareButton==nil) {
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareButton setTitle:@"分享" forState:UIControlStateNormal];
        _shareButton.backgroundColor = RGBColorHex(0x1693d3);
        [_shareButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _shareButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _shareButton.layer.cornerRadius = 30;
        _shareButton.clipsToBounds = YES;
        [_shareButton addTarget:self action:@selector(shareButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _shareButton;
}


#pragma mark - 点击图片Bannar跳转
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击了%zd轮播图",index);
}

@end
