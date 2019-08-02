//
//  BaseListModel.m
//  LS
//
//  Created by ZMac on 2018/11/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "BaseListModel.h"


@implementation BasePageModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"totalPage":@"total",
             @"currentPage":@"pageid"
             };
}

//获取当前页
-(NSUInteger)getCurrentPage
{
    return _currentPage;
}

//设置首页
-(void)setStartPage
{
    _currentPage = 1;
}

//设置下一页
-(void)setNextPage
{
    _currentPage++;
}

-(BOOL)isStartPage
{
    return _currentPage == 1;
}

//是否为最后一页
-(BOOL)isLastPage
{
    return _currentPage >= _totalPage;
}


@end


@implementation BaseListModel


//追加一页数据
-(void)addModel:(BaseListModel*)model
{
    if (model==nil)
    {
        return;
    }
    
    //总页数
    self.page.totalPage = model.page.totalPage;
    //当前页码
    self.page.currentPage = model.page.currentPage;
    
    [self.list addObjectsFromArray:model.list];
}
- (void)addMoreData:(BaseListModel*)model {
    
}


//清空数据
-(void)emptyList
{
    [self.list removeAllObjects];
    [self.page setStartPage];
}

-(BasePageModel*)page
{
    if (_page==nil)
    {
        _page = [[BasePageModel alloc]init];
        _page.totalPage = 1;
        _page.currentPage = 1;
    }
    
    return _page;
}

-(NSMutableArray*)list
{
    if (_list==nil)
    {
        _list = [[NSMutableArray alloc]init];
    }
    
    return _list;
}

@end
