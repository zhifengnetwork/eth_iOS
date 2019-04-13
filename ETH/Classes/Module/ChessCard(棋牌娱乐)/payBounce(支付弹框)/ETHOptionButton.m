//
//  ETHOptionButton.m
//  ETH
//
//  Created by weiming zhang on 2019/4/13.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHOptionButton.h"
#define KMainW [UIScreen mainScreen].bounds.size.width
#define KMainH [UIScreen mainScreen].bounds.size.height
#define KMarginYWhenMoving 20.0f
#define KRowHeight 20.0f
#define KMaxShowLine 6
#define KFont [UIFont systemFontOfSize:12.0f]
#define KBackColor [UIColor whiteColor]
@interface ETHOptionButton()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *searchArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) UIView *view;
@property (nonatomic, weak) UIButton *button;
@property (nonatomic, strong)UIImageView *iconImageView;
@property (nonatomic, copy, readwrite) NSString *title;
@property (nonatomic, assign, readwrite) NSInteger row;
@end
@implementation ETHOptionButton

static NSString *KOptionButtonCell = @"KOptionButtonCell";

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super initWithCoder:coder]) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    self.title = @"选择支付方式";
    _iconImageView = [[UIImageView alloc]init];
    [self addSubview:self.iconImageView];
    _iconImageView.image = [UIImage imageNamed:@"drop down"];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.centerX.equalTo(self.mas_centerX);
    }];
    UIButton *button = [[UIButton alloc] initWithFrame:self.bounds];
    button.layer.borderWidth = 1;
    button.layer.borderColor = RGBColorHex(0x232833).CGColor;
    [button setTitleColor:RGBColorHex(0x262626) forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [button setTitle:_title forState:UIControlStateNormal];
    button.titleLabel.font = KFont;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    self.button = button;
    
    
    //选项视图
    _tableView = [[UITableView alloc] init];
    _tableView.rowHeight = KRowHeight;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.layer.borderWidth = 1.0f;
    _tableView.layer.borderColor = RGBColorHex(0x232833).CGColor;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
}

- (void)buttonAction:(UIButton *)button
{
    [self creatControl];
    
    [self endEditing];
}

- (void)creatControl
{
    //坐标转换
    CGRect frame = [self.superview convertRect:self.frame toView:self.view];
    
    //显示选项按钮
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, self.frame.size.width, self.frame.size.height)];
    button.titleLabel.font = KFont;
    [button setTitle:_button.titleLabel.text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"optionBtn_sel"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    
    //设置tableviewFrame
    NSInteger rowCount = _showSearchBar ? KMaxShowLine - 1 : KMaxShowLine;
    CGFloat tabelViewY = _showSearchBar ? CGRectGetMaxY(_searchBar.frame) : CGRectGetMaxY(frame);
    if (_array.count <= rowCount) {
        _tableView.frame = CGRectMake(frame.origin.x, tabelViewY, frame.size.width, _array.count * KRowHeight);
    }else {
        _tableView.frame = CGRectMake(frame.origin.x, tabelViewY, frame.size.width, rowCount * KRowHeight);
    }
    [self.view addSubview:_tableView];
}

- (void)endEditing
{
    [[[self findViewController] view] endEditing:YES];
}

- (UIViewController *)findViewController
{
    id target = self;
    while (target) {
        target = ((UIResponder *)target).nextResponder;
        if ([target isKindOfClass:[UIViewController class]]) {
            break;
        }
    }
    return target;
}

- (void)setArray:(NSArray *)array
{
    _array = array;
    
    self.searchArray = [_array copy];
    
    [self setInfo];
}


- (void)setInfo
{
    if (_array.count > 0) {
        [_button setSelected:YES];
        _title = _array[0];
        [_button setTitle:_title forState:UIControlStateNormal];
    }
    
    [_tableView reloadData];
}




#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _searchArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KOptionButtonCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:KOptionButtonCell];
    }
    cell.textLabel.text = _searchArray[indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.font = KFont;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _row = indexPath.row;
    [_button setSelected:YES];
    self.title = _searchArray[_row];
    [self.button setTitle:self.title forState:UIControlStateNormal];
    [self dismissOptionAlert];
    
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectOptionInETHOptionButton:)]) {
        [_delegate didSelectOptionInETHOptionButton:self];
    }
}


@end
