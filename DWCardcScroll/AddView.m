//
//  AddView.m
//  DWCardcScroll
//
//  Created by DavidWang on 15/11/24.
//  Copyright © 2015年 davidwang. All rights reserved.
//

#import "AddView.h"

@implementation AddView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)ChangeData:(NSString *)title{
    _showLab.text = title;
}

@end
