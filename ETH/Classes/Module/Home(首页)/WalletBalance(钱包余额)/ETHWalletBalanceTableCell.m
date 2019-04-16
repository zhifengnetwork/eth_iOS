//
//  ETHWalletBalanceTableCell.m
//  ETH
//
//  Created by admin on 2019/4/4.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHWalletBalanceTableCell.h"

@interface ETHWalletBalanceTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* moneyLabel;

@end

@implementation ETHWalletBalanceTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = RGBColorHex(0x080e2c);
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.moneyLabel];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.centerY.equalTo(self->_bgView);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bgView.mas_right).offset(-10);
        make.centerY.equalTo(self->_bgView);
        
    }];
    
    CAShapeLayer *dotteShapeLayer = [CAShapeLayer layer];
    
    CGMutablePathRef dotteShapePath =  CGPathCreateMutable();
    
    //设置虚线颜色为blackColor
    [dotteShapeLayer setStrokeColor:[RGBColorHex(0x74778c) CGColor]];
    
    //设置虚线宽度
    dotteShapeLayer.lineWidth = 1.0f ;
    
    //10=线的宽度 5=每条线的间距
    NSArray *dotteShapeArr = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:3], nil];
    
    [dotteShapeLayer setLineDashPattern:dotteShapeArr];
    
    // 50为虚线Y值，和下面的50一起用。
    // kScreenWidth为虚线宽度
    CGPathMoveToPoint(dotteShapePath, NULL, 0 ,58);
    
    CGPathAddLineToPoint(dotteShapePath, NULL, 400, 58);
    
    [dotteShapeLayer setPath:dotteShapePath];
    
    CGPathRelease(dotteShapePath);
    
    //把绘制好的虚线添加上来
    [self.layer addSublayer:dotteShapeLayer];
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = _title;
}

-(void)setName:(NSString *)name
{
    _name = name;
    _moneyLabel.text = _name;
}


-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = RGBColorHex(0x475065);
    }
    return _bgView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0xffffff);
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.text = @"复投账户";
    }
    return _titleLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xffffff);
        _moneyLabel.font = [UIFont systemFontOfSize:15];
        _moneyLabel.text = @"0.0001";
    }
    return _moneyLabel;
}

@end
