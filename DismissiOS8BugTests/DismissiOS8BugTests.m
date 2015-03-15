//
//  DismissiOS8BugTests.m
//  DismissiOS8BugTests
//
//  Created by Boris Suvorov on 3/14/15.
//  Copyright (c) 2015 Boris Suvorov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface DismissiOS8BugTests : XCTestCase

@end

@implementation DismissiOS8BugTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
