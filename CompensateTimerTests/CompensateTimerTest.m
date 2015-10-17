//
//  CompensateTimerTest.m
//  CompensateTimer
//
//  Created by Evan on 10/17/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "CompensateTimer.h"

@interface CompensateTimerTest : XCTestCase

@end

@implementation CompensateTimerTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

-(void)testCompensateTimerNoRepeat {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    CompensateTimer *compensateTimer = [[CompensateTimer alloc]init];
    
    [compensateTimer setInterval:0.01 repeats:NO block:^ {
        
        [expectation fulfill];
        
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^ (NSError *error) {
        
        if (error) {
            XCTFail(@"expectation failed with error: %@", error);
        }
        
    }];
    
}

-(void)testCompensateTimerRepeat {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    __block int count = 0;
    
    CompensateTimer *compensateTimer = [[CompensateTimer alloc]init];
    __weak typeof(CompensateTimer) *_compensateTimer = compensateTimer;
    
    [compensateTimer setInterval:0.1 repeats:YES block:^ {
        
        count++;
        
        if (count == 2) {
            [_compensateTimer invalidate];
            [expectation fulfill];
        }
        
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^ (NSError *error) {
       
        if (error) {
            XCTFail(@"expectation failed with error: %@", error);
        }
        
    }];
    
}

-(void)testCompensateTimerCompensate {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    __block int count = 0;
    
    CompensateTimer *compensateTimer = [[CompensateTimer alloc]init];
    __weak typeof(CompensateTimer) *_compensateTimer = compensateTimer;
    
    NSDate *start = [[NSDate alloc]init];
    
    [compensateTimer setInterval:0.01 repeats:YES block:^ {
        
        count++;
        
        if (count == 10) {
            
            XCTAssertGreaterThan([start timeIntervalSinceNow], -0.2);
            
            [_compensateTimer invalidate];
            [expectation fulfill];
            
        }
        
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^ (NSError *error) {
        
        if (error) {
            XCTFail(@"expectation failed with error: %@", error);
        }
        
    }];
    
}

-(void)testCompensationTimerInvalidate {
    
    CompensateTimer *invalidateCompensateTimer = [[CompensateTimer alloc]init];
    CompensateTimer *compensateTimer = [[CompensateTimer alloc]init];
    
    [invalidateCompensateTimer setInterval:0.01 repeats:NO block:^ {
        XCTFail(@"fail");
    }];
    [invalidateCompensateTimer invalidate];
    
    [compensateTimer setInterval:0.1 repeats:NO block:^ {
        XCTAssert(@"succeed");
    }];
    
}


@end
