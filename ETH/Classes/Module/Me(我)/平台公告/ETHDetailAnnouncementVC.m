//
//  ETHDetailAnnouncementVC.m
//  ETH
//
//  Created by weiming zhang on 2019/5/18.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHDetailAnnouncementVC.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "ETHDetailAnnounceModel.h"
#import "UIImageView+WebCache.h"
#import "TYAlertController.h"
#import "TYAlertView.h"

@interface ETHDetailAnnouncementVC()<UIGestureRecognizerDelegate>
@property (nonatomic, strong)UILabel *mpLabel;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UILabel *authorLabel;
@property (nonatomic, strong)UILabel *contentLabel;
@property (nonatomic, strong)UIWebView *webView;

@end
@implementation ETHDetailAnnouncementVC
- (void)viewDidLoad{
    [self.view addSubview:self.mpLabel];
    [self.view addSubview:self.timeLabel];
    [self.view addSubview:self.authorLabel];
    [self.view addSubview:self.contentLabel];
    [self.view addSubview:self.webView];
    
    [_mpLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(12);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mpLabel.mas_right).with.offset(8);
        make.centerY.equalTo(self.mpLabel.mas_centerY);
    }];
    
    [_authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLabel.mas_right).with.offset(8);
        make.centerY.equalTo(self.mpLabel.mas_centerY);
    }];
    
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.authorLabel.mas_bottom).with.offset(20);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    
    
}


- (void)setAid:(NSInteger)aid{
    _aid = aid;
    [http_mine article_detail:_aid success:^(id responseObject) {
        if (kObjectIsEmpty(responseObject)) {
            return;
        }
        ETHAnnounceListModel *listModel = [ETHAnnounceListModel mj_objectWithKeyValues:responseObject];
        ETHDetailAnnounceModel *detailModel = listModel.article;
        self.title = detailModel.article_title;
        self.mpLabel.text = detailModel.article_mp;
        self.timeLabel.text = [NSString stringWithFormat:@"发布时间：%@",detailModel.article_date_v];
        if (kStringIsEmpty(detailModel.article_author)) {
            self.authorLabel.hidden = YES;
        }else{
            self.authorLabel.text = [NSString stringWithFormat:@"作者：%@",detailModel.article_author];
        }
        [self.webView loadHTMLString:detailModel.article_content baseURL:nil];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

- (UILabel *)mpLabel{
    if (_mpLabel == nil) {
        _mpLabel = [[UILabel alloc]init];
        _mpLabel.font = [UIFont systemFontOfSize:13];
        _mpLabel.textColor = [UIColor blueColor];
        _mpLabel.text = @"ETH";
    }return _mpLabel;
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.textColor = [UIColor grayColor];
        _timeLabel.text = @"发布时间：2019-03-13";
    }return _timeLabel;
}

- (UILabel *)authorLabel{
    if (_authorLabel == nil) {
        _authorLabel = [[UILabel alloc]init];
        _authorLabel.font = [UIFont systemFontOfSize:13];
        _authorLabel.textColor = [UIColor grayColor];
        _authorLabel.text = @"作者：2019-03-13";
    }return _authorLabel;
}



- (UIWebView *)webView{
    if (_webView == nil) {
        _webView = [[UIWebView alloc]init];
        UILongPressGestureRecognizer* longPressed = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed:)];
        longPressed.delegate = self;
        [self.webView addGestureRecognizer:longPressed];
        _webView.userInteractionEnabled = YES;
        
    }return _webView;
}


@end
