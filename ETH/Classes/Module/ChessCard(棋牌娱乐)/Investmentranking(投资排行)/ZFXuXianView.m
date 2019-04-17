//
//  ZFXuXianView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/12.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFXuXianView.h"

@implementation ZFXuXianView
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self setup];
//    }
//    return self;
//}
//
//- (void)setup{
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    [shapeLayer setBounds:self.bounds];
//    [shapeLayer setPosition:self.center];
//    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
//    // 设置虚线颜色为blackColor
//    [shapeLayer setStrokeColor:[self.backgroundColor CGColor]];
////    [shapeLayer setStrokeColor:[self.backgroundColor CGColor]];
//    // 3.0f设置虚线的宽度
//    [shapeLayer setLineWidth:1.0f];
//    [shapeLayer setLineJoin:kCALineJoinRound];
//    // 3=线的宽度 1=每条线的间距
//    [shapeLayer setLineDashPattern:
//    [NSArray arrayWithObjects:[NSNumber numberWithInt:3],
//    [NSNumber numberWithInt:1],nil]];
//    // Setup the path
//    CGMutablePathRef path = CGPathCreateMutable();
//     CGPathMoveToPoint(path, NULL, 0, 89);
//    CGPathAddLineToPoint(path, NULL, 320,89);
//    // Setup the path
//    CGMutablePathRef path1 = CGPathCreateMutable();
//    // 0,10代表初始坐标的x，y
//    // 320,10代表初始坐标的x，y
//    CGPathMoveToPoint(path1, NULL, 0, 100);
//
//    CGPathAddLineToPoint(path1, NULL, 320,100);
//
//    [shapeLayer setPath:path];
//     CGPathRelease(path1);
//     [[self layer] addSublayer:shapeLayer];
//}
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(currentContext, [UIColor lightGrayColor].CGColor);//设置线的颜色
    //设置虚线宽度
    CGContextSetLineWidth(currentContext, 1);
    //设置虚线绘制起点
    CGContextMoveToPoint(currentContext, 0, 0);
    //设置虚线绘制终点
    CGContextAddLineToPoint(currentContext, self.frame.origin.x + self.frame.size.width, 0);
    //设置虚线排列的宽度间隔:下面的arr中的数字表示先绘制3个点再绘制1个点
    CGFloat arr[] = {3,1};
    //下面最后一个参数“2”代表排列的个数。
    CGContextSetLineDash(currentContext, 4, arr, 2);
    CGContextDrawPath(currentContext, kCGPathStroke);
}

@end
