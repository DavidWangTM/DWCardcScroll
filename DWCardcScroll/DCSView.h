//
//  DCSView.h
//  DWCardcScroll
//
//  Created by DavidWang on 15/11/23.
//  Copyright © 2015年 davidwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddView.h"

@protocol DCSViewDelegate <NSObject>

-(void)DCSViewReturn:(NSInteger) index;

@end

@interface DCSView : UIView
@property (weak, nonatomic) id<DCSViewDelegate> delegate;
@property (strong ,nonatomic) NSMutableArray *data;
@property NSInteger index_row;

-(void)initView;

-(void)LeftAnimation;
-(void)RightAnimation;

@end
