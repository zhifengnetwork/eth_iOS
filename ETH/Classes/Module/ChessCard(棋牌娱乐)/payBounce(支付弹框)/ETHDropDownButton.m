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
- (void)setupDefaultTable {
    //将listView放在当前按钮下方位置，保持宽度相同，初始高度设置为0
    _listView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y+self.frame.size.height, self.frame.size.width, 0) style:UITableViewStylePlain];
    
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
    
    [listView reloadData];
}
@end
