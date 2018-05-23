//
//  Base3Controller.m
//  MasonryLJC
//
//  Created by LongLong on 2018/5/23.
//  Copyright © 2018年 learnHard. All rights reserved.
//

#import "Base3Controller.h"
#import <Masonry.h>

@interface Base3Controller ()

@property ( nonatomic, strong) UIView *block;
@property ( nonatomic, strong) UIView *autoblock;
@end

@implementation Base3Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.block = ({
        UIView *view = [UIView new];
        view.frame = CGRectMake(0, 0, 100, 100);
        [self.view addSubview:view];
        view.backgroundColor = [UIColor redColor];
        view;
    });
    
    self.autoblock = ({
        UIView *view = [UIView new];
        [self.view addSubview:view];
        
        view.backgroundColor = [UIColor yellowColor];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view).centerOffset(CGPointMake(0, -200));
            make.size.mas_equalTo(CGSizeMake(200, 200));
        }];
        
        view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.3, 0.3);
        view;
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
    
    // tansfrom
    [UIView animateWithDuration:3 animations:^{
        self.block.frame = CGRectMake(0, 200, 100, 100);
    }];
    [UIView animateWithDuration:3 animations:^{
        [self.autoblock mas_updateConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view).centerOffset(CGPointMake(0, -100));
        }];
        // auto layout  调用这个方法 让 layout 立即生效
        [self.view layoutIfNeeded];
        self.autoblock.transform = CGAffineTransformIdentity;
    }];
    
    // 弹簧.. 立即穿没有实现
//    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:<#(CGFloat)#> options:<#(UIViewAnimationOptions)#> animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>]
    
    
    
    // POp facebook;
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
