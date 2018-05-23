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
- (CGSize)intrinsicContentSize {
    
    CGSize size = [super intrinsicContentSize];
    
    NSLog(@"%@", NSStringFromCGSize(size));
    
//    return [super intrinsicContentSize];
    
    return self.innerSize;
    
}
@end
