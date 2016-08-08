//
//  ViewController.m
//  CNAKitDemo
//
//  Created by nagisa on 16/8/8.
//  Copyright © 2016年 cocoanagisa. All rights reserved.
//

#import "ViewController.h"
#import <CNAKit/CNAKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSInteger add = [CNAAddHelper addA:13 toB:12];
    NSLog(@"%zd",add);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
