//
//  DCSView.m
//  DWCardcScroll
//
//  Created by DavidWang on 15/11/23.
//  Copyright © 2015年 davidwang. All rights reserved.
//

#import "DCSView.h"

#define PADING_TOP 15
#define PADING_SHOW 10
#define PADING_LEFT_RIGHT 30
#define PADING_HEIGHT 50
#define PADING_BOTTOM 20

#define SCREENWITH   [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@implementation DCSView{
    UIView *leftView;
    UIView *rigthView;
    
    NSMutableArray *viewdata;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


-(void)initView{
    viewdata = [NSMutableArray new];
    UIView *view;
    for (int i = 0; i < 3; i++) {
        if (i == 0) {
            view = [[UIView alloc] initWithFrame:CGRectMake((-SCREENWITH + 2*PADING_LEFT_RIGHT +PADING_SHOW), PADING_TOP, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_HEIGHT)];
        }else if (i == 1){
            view = [[UIView alloc] initWithFrame:CGRectMake(PADING_LEFT_RIGHT, 0, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_BOTTOM)];
        }else if (i == 2){
            view = [[UIView alloc] initWithFrame:CGRectMake((SCREENWITH - PADING_LEFT_RIGHT + (PADING_LEFT_RIGHT - PADING_SHOW)), PADING_TOP, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_HEIGHT)];
        }
        view.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:view];
        [viewdata addObject:view];
    }
}

-(void)LeftAnimation{
    UIView *view = [viewdata objectAtIndex:0];
    [viewdata removeObjectAtIndex:0];
    [UIView animateWithDuration:0.25 animations:^{
        view.frame = CGRectMake(2 *(-SCREENWITH + 2*PADING_LEFT_RIGHT +PADING_SHOW), PADING_TOP, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_HEIGHT);
    } completion:^(BOOL finished) {
        view.frame = CGRectMake(2 *(SCREENWITH - PADING_LEFT_RIGHT + (PADING_LEFT_RIGHT - PADING_SHOW)), PADING_TOP, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_HEIGHT);
        [viewdata addObject:view];
        [UIView animateWithDuration:0.25 animations:^{
            view.frame = CGRectMake((SCREENWITH - PADING_LEFT_RIGHT + (PADING_LEFT_RIGHT - PADING_SHOW)), PADING_TOP, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_HEIGHT);
        }];
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        UIView *view = [viewdata objectAtIndex:0];
        UIView *view1 = [viewdata objectAtIndex:1];
        view.frame = CGRectMake((-SCREENWITH + 2*PADING_LEFT_RIGHT +PADING_SHOW), PADING_TOP, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_HEIGHT);
        view1.frame = CGRectMake(PADING_LEFT_RIGHT, 0, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_BOTTOM);
        
    }];
}


-(void)RightAnimation{

}



@end
