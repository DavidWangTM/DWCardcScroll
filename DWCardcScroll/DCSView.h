//
//  DCSView.h
//  DWCardcScroll
//
//  Created by DavidWang on 15/11/23.
//  Copyright © 2015年 davidwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCSView : UIView

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (strong ,nonatomic) NSMutableArray *data;
@property NSInteger index_row;

-(void)initView;

-(void)LeftAnimation;
-(void)RightAnimation;

@end
