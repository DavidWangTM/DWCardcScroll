//
//  AddView.h
//  DWCardcScroll
//
//  Created by DavidWang on 15/11/24.
//  Copyright © 2015年 davidwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddView : UIView
@property (weak, nonatomic) IBOutlet UILabel *showLab;
-(void)ChangeData:(NSString *)title;

@end
