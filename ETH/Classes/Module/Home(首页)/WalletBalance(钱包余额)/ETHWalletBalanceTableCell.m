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

@property (nonatomic, strong) UIView* line1View;

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
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.line1View];
    
    [_line1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.equalTo(self.contentView);
        make.height.mas_equalTo(0.5f);
    }];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.centerY.equalTo(self->_bgView);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bgView.mas_right).offset(-10);
        make.centerY.equalTo(self->_bgView);
        
    }];
    
    //竖线
    UIView *hLineView1 = [[UIView alloc] init];
    hLineView1.backgroundColor = RGBColorHex(0x232833);
    [self addSubview:hLineView1];
    
    [hLineView1 mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(10);
         make.top.bottom.equalTo(self.contentView);
         make.width.mas_equalTo(0.5f);
     }];
    
    //竖线
    UIView *hLineView2 = [[UIView alloc] init];
    hLineView2.backgroundColor = RGBColorHex(0x232833);
    [self addSubview:hLineView2];
    
    [hLineView2 mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.right.mas_equalTo(-10);
         make.top.bottom.equalTo(self.contentView);
         make.width.mas_equalTo(0.5f);
     }];
    
    CAShapeLayer *dotteShapeLayer = [CAShapeLayer layer];
    
    CGMutablePathRef dotteShapePath =  CGPathCreateMutable();
    
    //设置虚线颜色为blackColor
    [dotteShapeLayer setStrokeColor:[RGBColorHex(0x232833) CGColor]];
    
    //设置虚线宽度
    dotteShapeLayer.lineWidth = 1.0f ;
    
    //10=线的宽度 5=每条线的间距
    NSArray *dotteShapeArr = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:3], nil];
    
    [dotteShapeLayer setLineDashPattern:dotteShapeArr];
    
    // 50为虚线Y值，和下面的50一起用。
    // kScreenWidth为虚线宽度
    CGPathMoveToPoint(dotteShapePath, NULL, 0 ,45);
    
    CGPathAddLineToPoint(dotteShapePath, NULL, 400, 45);
    
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
        _bgView.backgroundColor = RGBColorHex(0xf4f4f4);
        _bgView.clipsToBounds = YES;
        _bgView.layer.cornerRadius = 3.0f;
    }
    return _bgView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x232833);
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"复投账户";
    }
    return _titleLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0x232833);
        _moneyLabel.font = [UIFont systemFontOfSize:12];
        _moneyLabel.text = @"0.0001";
    }
    return _moneyLabel;
}

- (UIView *)line1View {
    if (_line1View == nil) {
        _line1View = [[UIView alloc] init];
        _line1View.backgroundColor = RGBColorHex(0x232833);
    }
    return _line1View;
}

@end
