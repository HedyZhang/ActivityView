//
//  ViewController.m
//  ActivityView
//
//  Created by yanshu on 15/8/19.
//  Copyright (c) 2015年 yanshu. All rights reserved.
//

#import "ViewController.h"
#import "HDActivityIndicator.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HDActivityIndicator *indicator = [[HDActivityIndicator alloc] initWithFrame:CGRectMake(50, 100, 50, 50)];
    [self.view addSubview:indicator];
    
    [indicator startAnimating];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
