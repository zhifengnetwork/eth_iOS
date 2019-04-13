//
//  ETHDropDownButton.m
//  ETH
//
//  Created by weiming zhang on 2019/4/13.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHDropDownButton.h"
@interface ETHDropDownButton()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *listView;

@end
@implementation ETHDropDownButton
static NSString *CellIdentifier = @"DropDownCell";
- (void)setTitle:(NSString *)title List:(NSArray *)list{
    [self setTitle:[NSString stringWithString:title] forState:UIControlStateNormal];
    self.list = [NSArray arrayWithArray:list];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)didMoveToSuperview {
    [self.superview addSubview:_listView];
}

- (void)setup {
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    [self setTitleColor:RGBColorHex(0x262626) forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"drop down"] forState:UIControlStateNormal];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
//    [self setImageEdgeInsets:UIEdgeInsetsMake(0, self.bounds.size.width-20, 0, -self.bounds.size.width-20 )];
    [self setupDefaultTable];
    [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [self addTarget:self action:@selector(clickedToDropDown) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupDefaultTable {
    //将listView放在当前按钮下方位置，保持宽度相同，初始高度设置为0
    _listView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y+self.frame.size.height, self.frame.size.width, 0) style:UITableViewStylePlain];
    _listView.rowHeight = 20;
    _listView.dataSource = self;
    _listView.delegate = self;
}
//添加listView的下拉动画、收起动画方法
- (void)startDropDownAnimation {
    CGRect frame = _listView.frame;
    //使listView高度在0.3秒内从0过渡到最大高度以显示全部列表项
    frame.size.height = self.frame.size.height*self.list.count;
    [UIView animateWithDuration:0.3 animations:^{
        self->_listView.frame = frame;
    } completion:^(BOOL finished) {
        
    }];
}
- (void)startPackUpAnimation {
    CGRect frame = _listView.frame;
    //使listView高度在0.3秒内从最大高度过渡到0以隐藏全部列表项
    frame.size.height = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self->_listView.frame = frame;
    } completion:^(BOOL finished) {
        
    }];
}
//点击事件
- (void)clickedToDropDown {
    self.tag++;
    self.tag%2 ? [self startDropDownAnimation] : [self startPackUpAnimation];

    [_listView reloadData];
}
//实现listView的数据源和代理
#pragma mark - table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //根据成员list数组中的元素数返回列表的行数，必须保证self.list不为nil，才会调用cellForRowAtIndexPath方法
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //设置列表中的每一项文本、字体、颜色等
    cell.textLabel.text = self.list[indexPath.row];
    cell.textLabel.font = self.titleLabel.font;
    cell.textLabel.textColor = self.titleLabel.textColor;
    
    return cell;
}

#pragma mark - table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //选择某项后，使按钮标题内容变为当前选项
    [self setTitle:self.list[indexPath.row] forState:UIControlStateNormal];
    //执行列表收起动画
    [self clickedToDropDown];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //设置表单元高度为按钮高度
    return 20;
}
@end
