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
    NSInteger index;
    NSMutableArray *viewdata;
    NSInteger type_index;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


-(void)initView{
    AddView *view;
    type_index = 0;
    viewdata = [NSMutableArray new];
    index = 0;
    UISwipeGestureRecognizer *recognizer;
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self addGestureRecognizer:recognizer];
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self addGestureRecognizer:recognizer];
    for (int i = 0; i < 3; i++) {
        view = [[[NSBundle mainBundle] loadNibNamed:@"AddView" owner:self options:nil] firstObject];
        if (i == 0) {
            view.frame = CGRectMake((-SCREENWITH + 2*PADING_LEFT_RIGHT +PADING_SHOW), PADING_TOP, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_HEIGHT);
        }else if (i == 1){
            view.frame = CGRectMake(PADING_LEFT_RIGHT, 0, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_BOTTOM);
        }else if (i == 2){
            view.frame = CGRectMake((SCREENWITH - PADING_LEFT_RIGHT + (PADING_LEFT_RIGHT - PADING_SHOW)), PADING_TOP, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_HEIGHT);
        }
        NSInteger num = i - 1;
        if (num < 0) {
            num = _data.count - 1;
        }
        [view ChangeData:[_data objectAtIndex:num]];
        view.layer.cornerRadius = 5.0;
        view.clipsToBounds = YES;
        [self addSubview:view];
        [viewdata addObject:view];
    }
}

-(void)LeftAnimation{
    if (type_index == 2) {
        index -- ;
    }
    type_index = 1;
    index ++;
    if (index >= (_data.count - 1)) {
        index = -1;
    }
    NSLog(@"%ld",index);
    AddView *view = [viewdata objectAtIndex:0];
    AddView *view1 = [viewdata objectAtIndex:1];
    AddView *view2 = [viewdata objectAtIndex:2];
    [viewdata removeObjectAtIndex:0];
    [UIView animateWithDuration:0.25 animations:^{
        view.frame = CGRectMake(2 *(-SCREENWITH + 2*PADING_LEFT_RIGHT +PADING_SHOW), PADING_TOP, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_HEIGHT);
    } completion:^(BOOL finished) {
        view.frame = CGRectMake(2 *(SCREENWITH - PADING_LEFT_RIGHT + (PADING_LEFT_RIGHT - PADING_SHOW)), PADING_TOP, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_HEIGHT);
        [UIView animateWithDuration:0.25 animations:^{
            view.frame = CGRectMake((SCREENWITH - PADING_LEFT_RIGHT + (PADING_LEFT_RIGHT - PADING_SHOW)), PADING_TOP, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_HEIGHT);
        }];
        [view ChangeData:[_data objectAtIndex:(index + 1)]];
        [viewdata addObject:view];
    }];
    [UIView animateWithDuration:0.5 animations:^{
        view1.frame = CGRectMake((-SCREENWITH + 2*PADING_LEFT_RIGHT +PADING_SHOW), PADING_TOP, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_HEIGHT);
        view2.frame = CGRectMake(PADING_LEFT_RIGHT, 0, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_BOTTOM);
    }];
}


-(void)RightAnimation{
    if (type_index == 1) {
        index ++ ;
    }
    type_index = 2;
    index -- ;
    if (index <= 0) {
        index = _data.count ;
    }
    NSLog(@"%ld",index);
    AddView *view = [viewdata objectAtIndex:0];
    AddView *view1 = [viewdata objectAtIndex:1];
    AddView *view2 = [viewdata objectAtIndex:2];
    [viewdata removeObjectAtIndex:2];
    [UIView animateWithDuration:0.25 animations:^{
        view2.frame = CGRectMake(2 *(SCREENWITH - PADING_LEFT_RIGHT + (PADING_LEFT_RIGHT - PADING_SHOW)), PADING_TOP, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_HEIGHT);
    } completion:^(BOOL finished) {
        view2.frame = CGRectMake(2 *(-SCREENWITH + 2*PADING_LEFT_RIGHT +PADING_SHOW), PADING_TOP, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_HEIGHT);
        [UIView animateWithDuration:0.25 animations:^{
            view2.frame = CGRectMake((-SCREENWITH + 2*PADING_LEFT_RIGHT +PADING_SHOW), PADING_TOP, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_HEIGHT);
        }];
        [view ChangeData:[_data objectAtIndex:(index - 1)]];
        [viewdata insertObject:view2 atIndex:0];
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        view.frame = CGRectMake(PADING_LEFT_RIGHT, 0, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_BOTTOM);
        view1.frame = CGRectMake((SCREENWITH - PADING_LEFT_RIGHT + (PADING_LEFT_RIGHT - PADING_SHOW)), PADING_TOP, SCREENWITH - 2*PADING_LEFT_RIGHT, self.frame.size.height - PADING_HEIGHT);
    }];
    
}

-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionLeft) {
        [self LeftAnimation];
    }
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionRight) {
        //执行程序
        [self RightAnimation];
    }
    
}

@end
