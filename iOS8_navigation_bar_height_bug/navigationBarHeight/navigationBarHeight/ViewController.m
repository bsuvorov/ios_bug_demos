//
//  ViewController.m
//  navigationBarHeight
//
//  Created by Boris Suvorov on 3/15/15.
//  Copyright (c) 2015 Boris Suvorov. All rights reserved.
//

#import "ViewController.h"
#import "CustomWindowViewController.h"

@interface ViewController ()
@property (nonatomic) UINavigationController *embeddedNavVC;
@property (nonatomic) CustomWindowViewController *customWindowController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"navbar that will shrink on rotation";

    self.customWindowController = [[CustomWindowViewController alloc] init];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.customWindowController present];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.title = [NSString stringWithFormat:@"navbar height is %lld (first window)",
                  (long long) self.navigationController.navigationBar.frame.size.height];
}

@end
