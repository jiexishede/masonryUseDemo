//
//  testMarginViewController.m
//  MasonryLJC
//
//  Created by LongLong on 2018/5/23.
//  Copyright © 2018年 learnHard. All rights reserved.
//

#import "testMarginViewController.h"
#import <Masonry/Masonry.h>
@interface testMarginViewController ()

@end

@implementation testMarginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *v4 = ({
        UIView *view = [UIView new];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.height.width.equalTo(@50);
        }];
        view.backgroundColor = [UIColor purpleColor];
        view.layoutMargins = UIEdgeInsetsMake(-20, -20, -20, -20);
        view;
    });
    UIView *vtest = ({
        UIView *view = [UIView new];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(v4);
            make.top.equalTo(v4.mas_bottom);
            make.left.equalTo(v4.mas_leftMargin);
//            make.left.equalTo(v4.mas_left);
        }];
        view.backgroundColor = [UIColor redColor];
        view;
    });
    vtest;
}
@end
