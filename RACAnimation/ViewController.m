//
//  ViewController.m
//  RACAnimationDemo
//
//  Created by ZangChengwei on 15/3/15.
//  Copyright (c) 2015年 ZangChengwei. All rights reserved.
//

#import "ViewController.h"
#import <RAAnimationBuilder.h>
#import <ReactiveCocoa.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    RAC(view, frame) = [[[[RAAnimationBuilder new] setDuration:1.0] buildAnimationSignal] map:^id(NSNumber *percent) {
        CGRect rect = CGRectMake(100, 100, 100, 100);
        rect.origin.x += 50 * percent.floatValue;
        rect.origin.y += 170 * percent.floatValue;
        return [NSValue valueWithCGRect:rect];
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
