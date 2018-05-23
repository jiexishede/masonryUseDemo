//
//  Base1Controller.m
//  MasonryLJC
//
//  Created by LongLong on 2018/5/23.
//  Copyright © 2018年 learnHard. All rights reserved.
//

#import "Base1Controller.h"

@interface Base1Controller ()

@end

@implementation Base1Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //            make.size.mas_equalTo(CGSizeMake(50, 50));
    //
    //            make.width.equalTo(@50);
    //            make.height.equalTo(@50);
    
    //            make.width.mas_equalTo(50);
    //            make.height.mas_equalTo(50);
    
    //            make.width.height.equalTo(@50);
    //            make.width.height.mas_equalTo(@50);
    
    
    UIView *v1 = ({
        UIView *view = [UIView new];
        [self.view addSubview:view];
        // 等效 创建
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.top.equalTo(self.view);
            make.width.height.mas_equalTo(@50);
        
            // base 延伸 为 no
//            make.top.equalTo(self.mas_topLayoutGuide);
            view.backgroundColor = [UIColor blueColor];
        }];
        view;
    });
    
    UIView *v2 = ({
        UIView *view = [UIView new];
        [self.view addSubview:view];
        // 等效 创建
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.left.equalTo(v1.mas_right);
            make.top.equalTo(v1.mas_bottom);
        }];
        view.backgroundColor = [UIColor blueColor];
        view.layoutMargins = UIEdgeInsetsMake(-20, -20, -20, -20);
        view;
    });
    UIView *v3 = ({
        UIView *view = [UIView new];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.centerY.equalTo(v2);
            //会 crash
//            make.left.equalTo(v2.mas_rightMargin);
            make.left.equalTo(v2.mas_right);
        }];
        view.backgroundColor = [UIColor redColor];
        view;
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
