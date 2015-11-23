//
//  ViewController.m
//  DWCardcScroll
//
//  Created by DavidWang on 15/11/23.
//  Copyright © 2015年 davidwang. All rights reserved.
//

#import "ViewController.h"
#import "DCSView.h"

@interface ViewController (){
    DCSView *dcsview;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dcsview = [[[NSBundle mainBundle] loadNibNamed:@"DCSView" owner:self options:nil] firstObject];
    dcsview.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    [self.view addSubview:dcsview];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
