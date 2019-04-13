////
////  ETH3DGameFooterView.m
////  ZF
////
////  Created by admin on 2019/3/27.
////  Copyright © 2019 hyy. All rights reserved.
////
//
//#import "ETH3DGameFooterView.h"
//
//@interface ETH3DGameFooterView()
//
//@property (nonatomic, strong) UILabel* titleLabel;
//@property (nonatomic, strong) UIButton* confirmButton;
//
//@end
//
//@implementation ETH3DGameFooterView
//
//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self setup];
//    }
//    return self;
//}
//
//- (void)setup
//{
//    [self addSubview:self.titleLabel];
//    [self addSubview:self.confirmButton];
//
//    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(10);
//        make.centerY.equalTo(self);
//    }];
//
//    [_shoppingCartButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self->_collectionButton.mas_right);
//        make.width.height.mas_equalTo(50);
//    }];
//
//    [_addCartButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self->_shoppingCartButton.mas_right);
//        make.width.mas_equalTo(140);
//        make.height.mas_equalTo(50);
//    }];
//
//    [_immediatePurButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self->_addCartButton.mas_right);
//        make.width.mas_equalTo(140);
//        make.height.mas_equalTo(50);
//    }];
//
//    //竖线
//    UIView *hLineView = [[UIView alloc] init];
//    hLineView.backgroundColor = RGBColorHex(0xE8E8E8);
//    [self addSubview:hLineView];
//
//    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
//     {
//         make.left.equalTo(self->_collectionButton.mas_right);
//         make.centerY.equalTo(self->_collectionButton);
//         make.width.mas_equalTo(1.0f);
//         make.height.mas_equalTo(30.0f);
//     }];
//
//}
//
//
//- (void)collectionButtonDidClick
//{
//
//}
//
//- (void)shoppingCartButtonDidClick
//{
//
//}
//
//- (void)addCartButtonDidClick
//{
//
//}
//
//- (void)immediatePurButtonDidClick
//{
//
//}
//
//
//- (UIButton *)collectionButton {
//    if (_collectionButton == nil) {
//        _collectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_collectionButton setTitle:@"收藏" forState:UIControlStateNormal];
//        [_collectionButton setImage:[UIImage imageNamed:@"collect_default"] forState:UIControlStateNormal];
//        [_collectionButton setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
//        _collectionButton.titleLabel.font = [UIFont systemFontOfSize:11];
//        [_collectionButton setImagePosition:LXMImagePositionTop spacing:6];
//        [_collectionButton addTarget:self action:@selector(collectionButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _collectionButton;
//}
//
//
//- (UIButton *)shoppingCartButton {
//    if (_shoppingCartButton == nil) {
//        _shoppingCartButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_shoppingCartButton setTitle:@"购物车" forState:UIControlStateNormal];
//        [_shoppingCartButton setImage:[UIImage imageNamed:@"shopping_default"] forState:UIControlStateNormal];
//        [_shoppingCartButton setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
//        _shoppingCartButton.titleLabel.font = [UIFont systemFontOfSize:11];
//        [_shoppingCartButton setImagePosition:LXMImagePositionTop spacing:6];
//        [_shoppingCartButton addTarget:self action:@selector(shoppingCartButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _shoppingCartButton;
//}
//
//- (UIButton *)addCartButton {
//    if (_addCartButton == nil) {
//        _addCartButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_addCartButton setTitle:@"加入购物车" forState:UIControlStateNormal];
//        [_addCartButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
//        _addCartButton.backgroundColor = RGBColorHex(0xf3b53f);
//        _addCartButton.titleLabel.font = [UIFont systemFontOfSize:16];
//        [_addCartButton addTarget:self action:@selector(addCartButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _addCartButton;
//}
//
//- (UIButton *)immediatePurButton {
//    if (_immediatePurButton == nil) {
//        _immediatePurButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_immediatePurButton setTitle:@"立即购买" forState:UIControlStateNormal];
//        [_immediatePurButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
//        _immediatePurButton.backgroundColor = RGBColorHex(0xff5722);
//        _immediatePurButton.titleLabel.font = [UIFont systemFontOfSize:16];
//        [_immediatePurButton addTarget:self action:@selector(immediatePurButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _immediatePurButton;
//}
//@end
