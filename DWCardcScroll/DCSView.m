//
//  DCSView.m
//  DWCardcScroll
//
//  Created by DavidWang on 15/11/23.
//  Copyright © 2015年 davidwang. All rights reserved.
//

#import "DCSView.h"

@implementation DCSView{
    UIView *leftView;
    UIView *rigthView;
    CGRect left;
    CGRect right;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


-(void)layoutSubviews{
    [super layoutSubviews];
    left = _mainView.frame;
    left.origin.x = -(_mainView.frame.size.width + 20);
    leftView.frame = left;
    [self addSubview:leftView];
    right = _mainView.frame;
    right.origin.x = _mainView.frame.size.width + 30 + 20;
    [self addSubview:rigthView];
    
}



@end
