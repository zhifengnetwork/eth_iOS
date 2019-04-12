//
//  ETHChessCardCollectionCell.m
//  ETH
//
//  Created by admin on 2019/4/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHChessCardCollectionCell.h"
#import "UIView+HJViewStyle.h"

@interface ETHChessCardCollectionCell()

@property (nonatomic, strong) UIImageView* iconView;

@end

@implementation ETHChessCardCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = RGBColorHex(0x080e2c);
    [self.contentView addSubview:self.iconView];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
    
}

-(void)setIconName:(NSString *)iconName
{
    _iconName = iconName;
    _iconView.image = [UIImage imageNamed:_iconName];
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
        _iconView.image = [UIImage imageNamed:@"Welfare"];
    }
    return _iconView;
}



@end
