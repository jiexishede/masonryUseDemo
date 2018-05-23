//
//  MMView.m
//  MasonryLJC
//
//  Created by LongLong on 2018/5/23.
//  Copyright © 2018年 learnHard. All rights reserved.
//

#import "MMView.h"

@implementation MMView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// 获得 尺寸

// autolayout 没有设置 宽高的话就可以使用这个 值 来设定宽度

// 测试 git 命令 ci alias
// 测试 git alias difftool

// 测试 git alias md 

- (CGSize)intrinsicContentSize {
    
    CGSize size = [super intrinsicContentSize];
    
    NSLog(@"%@", NSStringFromCGSize(size));
    
//    return [super intrinsicContentSize];
    
    return self.innerSize;
    
}
@end
