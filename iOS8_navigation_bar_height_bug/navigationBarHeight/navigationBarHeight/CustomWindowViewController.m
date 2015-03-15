//
//  CustomWindowViewController.m
//  navigationBarHeight
//
//  Created by Boris Suvorov on 3/15/15.
//  Copyright (c) 2015 Boris Suvorov. All rights reserved.
//

#import "CustomWindowViewController.h"
#import "ViewController.h"

@interface CustomWindowViewController ()
@property (nonatomic) UIWindow *window;
@property (nonatomic) UINavigationController *embeddedNavVC;
@property (nonatomic) UIViewController *embeddedVC;
@property (nonatomic) UILabel *label;
@end

@implementation CustomWindowViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
}

- (void)createAndPrepareCustomWindow
{
    self.window = [[UIWindow alloc] init];
    self.window.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.window.opaque = NO;
    self.window.windowLevel = UIWindowLevelNormal;
    self.window.frame = [[UIScreen mainScreen] bounds];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor clearColor];
}

- (void)present {
    [self createAndPrepareCustomWindow];
    
    self.embeddedVC= [[UIViewController alloc] init];
    self.embeddedVC.view.backgroundColor = [UIColor yellowColor];
    self.embeddedVC.title = @"Navbar won't shrink on rotation";
    
    self.label = [[UILabel alloc] initWithFrame:self.embeddedVC.view.bounds];
    self.label.text = @"Navbar height must change on rotation, but it doesn't change when UINavigationController is presented through a second window";
    self.label.numberOfLines = 0;
    [self.embeddedVC.view addSubview:self.label];
    
    self.embeddedNavVC = [[UINavigationController alloc] initWithRootViewController:self.embeddedVC];
   
    self.embeddedNavVC.view.backgroundColor = [UIColor yellowColor];
    self.embeddedNavVC.view.frame = CGRectMake(5, 100, 310, 200);
    self.embeddedNavVC.view.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;

    self.window.rootViewController = self;
    [self.view addSubview:self.embeddedNavVC.view];
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.label.frame = self.embeddedVC.view.bounds;
    self.embeddedVC.title = [NSString stringWithFormat:@"navbar height is %lld. (second window)", (long long) self.embeddedNavVC.navigationBar.frame.size.height];
}



@end
