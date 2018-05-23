//
//  ViewController.m
//  MasonryLJC
//
//  Created by LongLong on 2018/5/23.
//  Copyright © 2018年 learnHard. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property ( nonatomic, strong) UITableView * tableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableview  = ({
        
        
        
        UITableView *view = [UITableView new];
        
        [self.view addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        view.delegate = self;
        view.dataSource = self;
        view;
    });
}

#pragma mark - tableview

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Example%@", @(indexPath.row +1)];
    
    return cell;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 反射的 方式, 高级用法
    // 检测 有没有教  Base xx controll 的控制器
    // 有就 导航
    Class cls = NSClassFromString([NSString stringWithFormat:@"Base%@Controller", @(indexPath.row + 1)]);
    // 注意 这里没有"Import控制器 "就能创建了!!!
    if (cls) {
        [self.navigationController pushViewController:[cls new] animated:YES];
    }
}


@end
