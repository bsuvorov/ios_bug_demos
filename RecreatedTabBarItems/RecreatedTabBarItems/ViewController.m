//
//  ViewController.m
//  RecreatedTabBarItems
//
//  Created by Boris Suvorov on 3/15/15.
//  Copyright (c) 2015 Boris Suvorov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) UITextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.navigationController setToolbarHidden:NO];
    self.view.backgroundColor = [UIColor greenColor];
    self.textView = [[UITextView alloc] init];
    self.textView.text = @"";
    self.textView.editable = NO;
    self.textView.font = [UIFont systemFontOfSize:20];
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.toolbarItems = @[left];

    [self.view addSubview:self.textView];
    
    self.textView.frame = self.view.bounds;
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:nil completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        UITabBarItem *tabBarItem = [self.toolbarItems objectAtIndex:0];
        // technically we shouldn't be getting view this way, because it is hacky way to obtain in.
        // thus it is not a bug per se.
        // however, iPad code is not going to change view, but iPhone will change view if it is a toolbar bar button item.
        // same logic does not apply to navigation bars which makes it even a bit more weird.
        UIView *view = [tabBarItem valueForKey:@"view"];
        NSString *addressOfBarButtonItem = [NSString stringWithFormat:@"bar button view = %@", view];
        self.textView.text = [NSString stringWithFormat:@"%@\n%@\n", self.textView.text, addressOfBarButtonItem];

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
