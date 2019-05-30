//
//  ETHBigImageView.m
//  ETH
//
//  Created by weiming zhang on 2019/5/30.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHBigImageView.h"
@interface ETHBigImageView()<UIScrollViewDelegate>
@property (nonatomic, strong)UIScrollView *scrollView;

@property (nonatomic, strong)UIImageView *browseImgView;
@end
@implementation ETHBigImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cleckImageViewAction:)];
    [self addGestureRecognizer:tapGesture];
}

//点击图片后的方法(即图片的放大全屏效果)
- (void)cleckImageViewAction: (UITapGestureRecognizer *)tap{
    if (![(UIImageView *)tap.view image]) {
        return;
    }
    //scrollView作为背景
    UIScrollView *bgView = [[UIScrollView alloc] init];
    bgView.frame = [UIScreen mainScreen].bounds;
    bgView.backgroundColor = [UIColor blackColor];
//    UITapGestureRecognizer *tapBg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBgView)];
//    [bgView addGestureRecognizer:tapBg];
    [self.window addSubview:bgView];
    self.scrollView = bgView;
    //最大放大比例
    self.scrollView.maximumZoomScale = 1.5;
    self.scrollView.delegate = self;

    
    //创建显示图像的视图
    //初始化要显示的图片内容的imageView
    UIImageView *browseImgView = [[UIImageView alloc] init];
    browseImgView.contentMode = UIViewContentModeScaleAspectFit;
    self.browseImgView = browseImgView;
    //要显示的图片，即要放大的图片
    _browseImgView.image = self.image;
    [bgView addSubview:browseImgView];
    
    [browseImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_top).with.offset(20);
        make.centerY.equalTo(bgView.mas_centerY);
        make.width.mas_equalTo(LL_ScreenWidth);
        make.height.mas_equalTo(LL_ScreenHeight-20);
    }];
    
    browseImgView.userInteractionEnabled = YES;
    self.scrollView.contentSize = browseImgView.image.size;
    //添加点击手势（即点击图片后退出全屏）
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeView)];
    [browseImgView addGestureRecognizer:tapGesture];
    
    [self shakeToShow:bgView];//放大过程中的动画
    
}

-(void)closeView{
    
    [self.scrollView removeFromSuperview];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.browseImgView;
}



//放大过程中出现的缓慢动画
- (void) shakeToShow:(UIView*)aView{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.3;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
}

@end
