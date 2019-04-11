//
//  ETHDealTF.m
//  ETH
//
//  Created by weiming zhang on 2019/4/10.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHDealTF.h"

@implementation ETHDealTF
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font =[UIFont systemFontOfSize:12];
        self.textColor =[UIColor whiteColor];
    }
    return self;
}
//控制placeHolder的位置，左右缩20
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    //return CGRectInset(bounds, 20, 0);
    CGRect inset = CGRectMake(bounds.origin.x+6, bounds.origin.y, bounds.size.width -6, bounds.size.height);//更好理解些
    return inset;
}
//控制显示文本的位置
-(CGRect)textRectForBounds:(CGRect)bounds
{
    //return CGRectInset(bounds, 50, 0);
    CGRect inset = CGRectMake(bounds.origin.x+6, bounds.origin.y, bounds.size.width -6, bounds.size.height);//更好理解些
    return inset;
}
//控制编辑文本的位置
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    //return CGRectInset( bounds, 10 , 0 );
    CGRect inset = CGRectMake(bounds.origin.x +6, bounds.origin.y, bounds.size.width -6, bounds.size.height);
    return inset;
}

@end
