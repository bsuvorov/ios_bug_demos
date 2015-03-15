//
//  ViewController.m
//  DismissiOS8Bug
//
//  Created by Boris Suvorov on 3/14/15.
//  Copyright (c) 2015 Boris Suvorov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UIButton *button;
@property (nonatomic) UILabel *hierarchyLabel;

@end


#define kButtonFrame CGRectMake(0, 20, 320, 40)

static NSUInteger vcIndex = 0;
static __weak UIViewController *vcToDismiss = nil;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *backgroundColors = @[[UIColor greenColor],
                                 [UIColor yellowColor],
                                 [UIColor redColor]];
    
    


    self.view.backgroundColor = [backgroundColors objectAtIndex:vcIndex];
    
    self.hierarchyLabel = [[UILabel alloc] init];
    self.hierarchyLabel.text = [NSString stringWithFormat:@"%lld", (long long)vcIndex];
    self.hierarchyLabel.textAlignment = NSTextAlignmentCenter;
    self.hierarchyLabel.font = [UIFont systemFontOfSize:550];

    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.titleLabel.font = [UIFont  systemFontOfSize:15];
    if (vcIndex < 2) {
        [self.button setTitle:@"Press to add next View Controller modally" forState:UIControlStateNormal];
        self.button.titleLabel.text = @"Next VC";
        [self.button addTarget:self
                        action:@selector(nextVC)
              forControlEvents:UIControlEventTouchUpInside];
        
    } else {
        [self.button setTitle:@"Press to see iOS8-specific animation bug"
                     forState:UIControlStateNormal];
        [self.button addTarget:self
                        action:@selector(dismissForButRepro)
              forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (vcIndex == 0) {
        vcToDismiss = self;
    }

    [self.view addSubview:self.hierarchyLabel];
    [self.view addSubview:self.button];
}

- (void)nextVC
{
    vcIndex++;
    UIViewController *vc = [[ViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)dismissForButRepro
{
    UIViewController *vc = vcToDismiss;
    vcIndex = 0;
    [vc dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.hierarchyLabel.frame = self.view.bounds;
    self.hierarchyLabel.center = CGPointMake(self.hierarchyLabel.center.x, self.hierarchyLabel.center.y + 20);
    self.button.frame = kButtonFrame;
}
@end
