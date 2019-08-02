//
//  ETHAdvertisementVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/5.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHAdvertisementVC.h"
#import "ETHTitleView.h"
#import "ETHDealVC.h"

@interface ETHAdvertisementVC ()
@property (nonatomic, strong)ETHTitleView *titleView;
@property (nonatomic, strong)UIImageView *backImg;
@property (nonatomic, strong)UISegmentedControl* segment;
@property (nonatomic, strong)ETHDealVC *vc1;
@property (nonatomic, strong)ETHDealVC *vc2;

@end

@implementation ETHAdvertisementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    self.view.backgroundColor = RGBColorHex(0x3c3f51);
}

- (void)setup{
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.backImg];
    [self.view addSubview:self.segment];
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(LL_StatusBarAndNavigationBarHeight +55);
    }];
    [_backImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).with.offset(-50);
        make.left.right.bottom.equalTo(self.view);
    }];
    [_segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).with.offset(10);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(29);
    }];
    
    [self addChildViewController:self.vc1];
    [self.view addSubview:_vc1.view];
    [_vc1.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.segment.mas_bottom).with.offset(10);
        make.left.right.bottom.equalTo(self.view);
    }];
    [_vc1 didMoveToParentViewController:self];
    NSArray* array = @[@"买入ETH",@"卖出ETH"];
    UISegmentedControl* segment1 = [[UISegmentedControl alloc]initWithItems:array];
    //设置位置和大小
    segment1.frame = CGRectMake(0, 0, LL_ScreenWidth, 30);
    [self.view addSubview:segment1];
    //删除索引为0的按钮
    [segment1 removeSegmentAtIndex:0 animated:YES];
    //删除所有按钮
    [segment1 removeAllSegments];
    
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
        self.backImg.image = [UIImage imageNamed:@"BG"];
    }
    return _backImg;
}
- (UISegmentedControl *)segment{
    if (_segment == nil) {
        _segment = [[UISegmentedControl alloc]init];
        //在索引值为0的位置上插入一个标题为red的按钮，第三个参数为是否开启动画
        [_segment insertSegmentWithTitle:@"买入ETH" atIndex:0 animated:YES];
        [_segment insertSegmentWithTitle:@"卖出ETH" atIndex:1 animated:YES];
        _segment.layer.cornerRadius = 4;
        _segment.layer.borderWidth =1;
        _segment.layer.borderColor = RGBColorHex(0x6a82f4).CGColor;
        //设置背景颜色
        _segment.backgroundColor = [UIColor clearColor];
        //设置标题和边框的颜色
        _segment.tintColor = RGBColorHex(0x6a82f4);
        [_segment setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}forState:UIControlStateSelected];
        [_segment setTitleTextAttributes:@{NSForegroundColorAttributeName:RGBColorHex(0xbbbcc1),NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0f]}forState:UIControlStateNormal];
        //设置初始选中值，默认是没有选中
        _segment.selectedSegmentIndex = 0;
        //    self.view.backgroundColor = [UIColor magentaColor];
        //绑定事件
        [_segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
        
    }return _segment;
}

- (ETHDealVC *)vc1{
    if (_vc1 == nil) {
        _vc1 = [[ETHDealVC alloc]init];
    }return _vc1;
}
- (ETHDealVC *)vc2{
    if (_vc2 == nil) {
        _vc2 = [[ETHDealVC alloc]init];
    }return _vc2;
}
#pragma mark --方法
-(void)segmentAction:(UISegmentedControl*)sender
{
    //titleForSegmentAtIndex通过索引值获取被选中的分段控制器的按钮标题，selectedSegmentIndex 是获取被选中按钮的索引值
    if (sender.selectedSegmentIndex == 1) {
        [self addChildViewController:self.vc2];
        [self transitionFromViewController:self.vc1 toViewController:self.vc2 duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
            if(finished){
                [self->_vc2 didMoveToParentViewController:self];
                [self->_vc1 willMoveToParentViewController:nil];
                [self->_vc1 removeFromParentViewController];
            }
        }];
        [self.view addSubview:_vc2.view];
        [_vc2.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.segment.mas_bottom).with.offset(10);
            make.left.right.bottom.equalTo(self.view);
        }];
        [_vc2 didMoveToParentViewController:self];
        _vc2.type= 1;
    }else{
        [self addChildViewController:self.vc1];
        
        [self transitionFromViewController:self.vc2 toViewController:self.vc1 duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
            if(finished){
                [self->_vc1 didMoveToParentViewController:self];
                [self->_vc2 willMoveToParentViewController:nil];
                [self->_vc2 removeFromParentViewController];
            }else{
            }
        }];
        [self.view addSubview:_vc1.view];
        [_vc1.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.segment.mas_bottom).with.offset(10);
            make.left.right.bottom.equalTo(self.view);
        }];
        [_vc1 didMoveToParentViewController:self];
        _vc1.type = 0;
    }
    
}
@end
