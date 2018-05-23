//
//  Base1Controller.m
//  MasonryLJC
//
//  Created by LongLong on 2018/5/23.
//  Copyright © 2018年 learnHard. All rights reserved.
//

#import "Base1Controller.h"

#import "MMView.h"

@interface Base1Controller ()

//@property (nonatomic, copy) NSString *e
@property (nonatomic, strong) UILabel *labelCenter;

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
//            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.width.equalTo(v2).multipliedBy(2.0);
            make.height.equalTo(v2).dividedBy(2.0);
            make.centerY.equalTo(v2);
            //会 crash
            make.left.equalTo(v2.mas_rightMargin);
//            make.left.equalTo(v2.mas_right);
            
            //
//            make.edges.equalTo(v2).insets;
        }];
        view.backgroundColor = [UIColor redColor];
        view;
    });
    
    
    /// instrinsicContentSize 最重的  autolayout  很重的
    
    // intrinsic  : 返回代码的缺省大小.
    
    
//    UIView *v4 = ({
//
//        MMView *view = [MMView new];
//        [self.view addSubview:view];
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.center.equalTo(self.view);
//            make.width.equalTo(@50);
//        }];
//        //  这个 值 是 什么
//            /// instrinsicContentSize 最重的  autolayout  很重的
//        // auto 判断 当你 没有 设定这个 autoLayout 的宽高 尺寸时, , 会根据这个值设定 宽高, 这就是  不用设定 label 宽高的原因.
//        view.innerSize = CGSizeMake(100,100);
//        view.backgroundColor = [UIColor purpleColor];
//        view;
//    });
    
    
    
    // 属性 压缩
    
    UILabel *lbl1 = ({
        UILabel *label = [UILabel new];
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.view);
            make.left.equalTo(self.view);
        }];
        label.text = @"左边的";
        label.backgroundColor = [UIColor grayColor];
        [label setContentCompressionResistancePriority:(UILayoutPriorityRequired) forAxis:UILayoutConstraintAxisHorizontal];
        label;
    });
    
    UILabel *lbl2 = ({
        
        UILabel *label = [UILabel new];
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.view);
            make.left.equalTo(lbl1.mas_right);
        }];
        label.text = @"中间的文字";
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor redColor];
        label;
    });
    
    self.labelCenter = lbl2;
    
    // 开始 点击 右边的 被压缩了
    UILabel *lbl3 = ({
        UILabel *label = [UILabel new];
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.view);
            make.right.equalTo(self.view.mas_right);
            make.left.equalTo(lbl2.mas_right);
        }];
        label.text = @"右边";
        label.backgroundColor = [UIColor grayColor];
        [label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [label setContentCompressionResistancePriority:(UILayoutPriorityRequired) forAxis:UILayoutConstraintAxisHorizontal];
        label;
    });

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources tha t can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
 
    self.labelCenter.text = [self.labelCenter.text stringByAppendingString:@"test"];
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
