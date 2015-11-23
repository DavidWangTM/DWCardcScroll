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
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


-(void)layoutSubviews{
    [super layoutSubviews];
    leftView = [[UIView alloc] initWithFrame:CGRectMake((-_mainView.frame.size.width + 10), _mainView.frame.origin.y + 15, _mainView.frame.size.width, _mainView.frame.size.height - 30)];
    leftView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:leftView];
    rigthView = [[UIView alloc] initWithFrame:CGRectMake((_mainView.frame.size.width + 50), _mainView.frame.origin.y + 15, _mainView.frame.size.width, _mainView.frame.size.height - 30)];
    rigthView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:rigthView];
    
}



@end
