//
//  ETHHomePageTitleHeadView.m
//  ZF
//
//  Created by apple on 2019/3/2.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ETHHomePageTitleHeadView.h"
#import "UUMarqueeView.h"
#import "ETHNoticeModel.h"


@interface ETHHomePageTitleHeadView()<UUMarqueeViewDelegate>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* noticeLabel;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UUMarqueeView* marqueeView;

@end

@implementation ETHHomePageTitleHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.backgroundColor = RGBColorHex(0x080e2c);
    [self addSubview:self.bgView];
    [self addSubview:self.iconView];
    [self addSubview:self.noticeLabel];
    [self addSubview:self.marqueeView];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(30);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.centerY.equalTo(self->_bgView);
    }];
    
    [_noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(9);
        make.centerY.equalTo(self->_bgView);
    }];
    
    [_marqueeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_noticeLabel.mas_right).offset(10);
        make.top.mas_equalTo(10);
        make.bottom.right.equalTo(self);
    }];
    
}

-(void)setNotices:(NSMutableArray *)notices
{
    _notices = notices;
    [self.marqueeView reloadData];
}

- (NSUInteger)numberOfVisibleItemsForMarqueeView:(UUMarqueeView*)marqueeView {
    // 指定可视条目的行数，仅[UUMarqueeViewDirectionUpward]时被调用。
    // 当[UUMarqueeViewDirectionLeftward]时行数固定为1。
    return 1;
}

- (NSUInteger)numberOfDataForMarqueeView:(UUMarqueeView*)marqueeView {
    // 指定数据源的个数。例:数据源是字符串数组@[@"A", @"B", @"C"]时，return 3。
    return self.notices.count;
}

- (void)createItemView:(UIView*)itemView forMarqueeView:(UUMarqueeView*)marqueeView {
    // 在marquee view创建时（即'-(void)reloadData'调用后），用于创建条目视图的初始结构，可自行添加任意subview。
    // ### 给必要的subview添加tag，可在'-(void)updateItemView:withData:forMarqueeView:'调用时快捷获取并设置内容。
    UILabel *content = [[UILabel alloc] initWithFrame:itemView.bounds];
    content.font = [UIFont systemFontOfSize:12.0f];
    content.textColor = [UIColor whiteColor];
    content.tag = 1001;
    [itemView addSubview:content];
}

- (void)updateItemView:(UIView*)itemView atIndex:(NSUInteger)index forMarqueeView:(UUMarqueeView*)marqueeView {
    // 设定即将显示的条目内容，在每次marquee view滑动时被调用。
    // 'index'即为数据源数组的索引值。
    UILabel *content = [itemView viewWithTag:1001];
    ETHNoticeModel* model = [self.notices objectAtIndex:index];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithData:[model.detail dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, attrStr.length)];
    content.attributedText = attrStr;
    //    content.text = model.detail;
}

- (CGFloat)itemViewWidthAtIndex:(NSUInteger)index forMarqueeView:(UUMarqueeView*)marqueeView {
    // 指定条目在显示数据源内容时的视图宽度，仅[UUMarqueeViewDirectionLeftward]时被调用。
    // ### 在数据源不变的情况下，宽度可以仅计算一次并缓存复用。
    ETHNoticeModel* model = [self.notices objectAtIndex:index];
    UILabel *content = [[UILabel alloc] init];
    content.font = [UIFont systemFontOfSize:12.0f];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithData:[model.detail dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, attrStr.length)];
    content.attributedText = attrStr;
//    content.text = model.detail;
    return content.intrinsicContentSize.width;
}

- (void)didTouchItemViewAtIndex:(NSUInteger)index forMarqueeView:(UUMarqueeView*)marqueeView {
    // 点击事件回调。在'touchEnabled'设置为YES后，触发点击事件时被调用。
    NSLog(@"Touch at index %lu", (unsigned long)index);
}


- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"Notice"];
    }
    return _iconView;
}

- (UILabel *)noticeLabel {
    if (_noticeLabel == nil) {
        _noticeLabel = [[UILabel alloc] init];
        _noticeLabel.textColor = RGBColorHex(0xfaa526);
        _noticeLabel.font = [UIFont systemFontOfSize:15];
        _noticeLabel.text = @"公告";
    }
    return _noticeLabel;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0xffffff);
        _titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _titleLabel;
}

-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = RGBColorHex(0x202d67);
    }
    return _bgView;
}


-(UUMarqueeView* )marqueeView
{
    if (_marqueeView==nil) {
        _marqueeView = [[UUMarqueeView alloc]init];
        _marqueeView.direction = UUMarqueeViewDirectionLeftward;
        _marqueeView.delegate = self;
        _marqueeView.timeIntervalPerScroll = 0.0f;    // 条目滑动间隔
        _marqueeView.scrollSpeed = 60.0f;    // 滑动速度
        _marqueeView.itemSpacing = 20.0f;    // 左右相邻两个条目的间距，当左侧条目内容的长度超出marquee view整体长度时有效
        _marqueeView.touchEnabled = YES;    // 设置为YES可监听点击事件，默认值为NO
    }
    
    return _marqueeView;
}

@end
