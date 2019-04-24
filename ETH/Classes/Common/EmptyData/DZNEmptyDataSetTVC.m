//
//  DZNEmptyDataSetTVC.m
//  XV
//
//  Created by apple on 29/03/2019.
//  Copyright © 2019 XR. All rights reserved.
//

#import "DZNEmptyDataSetTVC.h"
#import "UIScrollView+EmptyDataSet.h"
#import "RefreshGifHeader.h"
#import "ETHTool.h"


@interface DZNEmptyDataSetTVC()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@end


@implementation DZNEmptyDataSetTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isShowEmptyData = NO;
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
}

//空白页图片
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
//    if( ![XVTool isInternetConnection] )
//    {
//        return [UIImage imageNamed:@"icon_default_networl_down"];
//    }
    
    UIImage* image = nil;
    if( [self respondsToSelector:@selector(imageForEmptyDataSet)] )
    {
        image =  [self performSelector:@selector(imageForEmptyDataSet)];
    }
    
    return image;
}


//子类重写这个方法其实不同的空白图片
- (UIImage *)imageForEmptyDataSet
{
    return [UIImage imageNamed:@"nothing"];
}


//空白页标题文本
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    
    NSString *text = @"";
//    if( ![XVTool isInternetConnection] )
//    {
//        text = @"网络不给力，请检查您的网络环境";
//        NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
//                                     NSForegroundColorAttributeName: RGBColor(173, 173, 173)};
//
//        return [[NSAttributedString alloc] initWithString:text attributes:attributes];
//    }
    
    NSAttributedString *attr = nil;
    if( [self respondsToSelector:@selector(titleForEmptyDataSet)] )
    {
        attr =  [self performSelector:@selector(titleForEmptyDataSet)];
    }
    
    return attr;
}

//子类重写这个方法其实不同的空白文字
- (NSAttributedString *)titleForEmptyDataSet
{
    NSString *text = @"暂时没有任何记录";
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName: RGBColor(173, 173, 173)};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}


//是否显示空白页，默认YES
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    return self.isShowEmptyData;
}

//空白页点击事件
- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView {
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
}


//空白页按钮图片
- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
//    if( ![XVTool isInternetConnection] )
//    {
//        return nil;
//    }
    
    UIImage* image = nil;
    if( [self respondsToSelector:@selector(buttonImageForEmptyDataSet)] )
    {
        image =  [self performSelector:@selector(buttonImageForEmptyDataSet)];
    }
    
    return image;
}

//子类重写这个方法其实不同的空白页按钮图片
- (UIImage *)buttonImageForEmptyDataSet
{
    return nil;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    
}

@end
