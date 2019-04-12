//
//  ETH3DGameTableCell.m
//  ETH
//
//  Created by admin on 2019/4/12.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETH3DGameTableCell.h"
#import "ETHBetNumberCollectionCell.h"


@interface ETH3DGameTableCell ()<UICollectionViewDelegate, UICollectionViewDataSource,ETHBetNumberCollectionCellDelegate>

@property (nonatomic, strong) UIButton* digitButton;

@property (nonatomic, strong) UICollectionView* collectionView;

@end


@implementation ETH3DGameTableCell

static NSString *const ETHBetNumberCollectionCellID = @"ETHBetNumberCollectionCellID";


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
    _collectionView.backgroundColor = RGBColorHex(0xf4f4f4);
   
    [self.contentView addSubview:self.collectionView];
    [self.contentView addSubview:self.digitButton];
    
    [_digitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(15);
    }];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_digitButton.mas_right).offset(35);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(98);
    }];
}


#pragma mark - dataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ETHBetNumberCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ETHBetNumberCollectionCellID forIndexPath:indexPath];
    if (indexPath.item==0)
    {
        cell.title = @"0";
    }
    else if (indexPath.item==1)
    {
        cell.title = @"1";
    }
    else if (indexPath.item==2)
    {
        cell.title = @"2";
    }
    else if (indexPath.item==3)
    {
        cell.title = @"3";
    }
    else if (indexPath.item==4)
    {
        cell.title = @"4";
    }
    else if (indexPath.item==5)
    {
        cell.title = @"5";
    }
    else if (indexPath.item==6)
    {
        cell.title = @"6";
    }
    else if (indexPath.item==7)
    {
        cell.title = @"7";
    }
    else if (indexPath.item==8)
    {
        cell.title = @"8";
    }
    else if (indexPath.item==9)
    {
        cell.title = @"9";
    }
    
    cell.indexPath = indexPath;
    cell.delegate = self;
    
    return cell;
}


//预览cell点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)digitButtonDidClick
{
    
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        float fw = (kScreenWidth-30)*0.25;
        layout.itemSize = CGSizeMake(fw, 60);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[ETHBetNumberCollectionCell class] forCellWithReuseIdentifier:ETHBetNumberCollectionCellID];
    }
    return _collectionView;
}

- (UIButton *)digitButton {
    if (_digitButton == nil) {
        _digitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_digitButton setTitle:@"百位" forState:UIControlStateNormal];
        [_digitButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _digitButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _digitButton.backgroundColor = RGBColorHex(0x2f4577);
        [_digitButton addTarget:self action:@selector(digitButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _digitButton;
}

@end
