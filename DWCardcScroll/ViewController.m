//
//  ViewController.m
//  DWCardcScroll
//
//  Created by DavidWang on 15/11/23.
//  Copyright © 2015年 davidwang. All rights reserved.
//

#import "ViewController.h"
#import "AddView.h"

@interface ViewController (){
    NSMutableArray *data;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    data = [NSMutableArray new];
    for (int i =0 ; i< 10; i++) {
        [data addObject:[NSString stringWithFormat:@"%d",i]];
    }
    _dcsview.data = data;
    [_dcsview initView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
