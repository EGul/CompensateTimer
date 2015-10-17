//
//  CompensateTimer.m
//  CompensateTimer
//
//  Created by Evan on 10/17/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import "CompensateTimer.h"

@interface CompensateTimer () {
    NSTimer *timer;
    float _interval;
    BOOL _repeats;
    void (^_block)(void);
    float count;
    NSDate *start;
}

-(void)didComplete;

@end

@implementation CompensateTimer

-(void)setInterval:(float)interval repeats:(BOOL)repeats block:(void (^)(void))block {
    
    _interval = interval;
    _repeats = repeats;
    _block = block;
    
    count = 0;
        
    timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(didComplete) userInfo:nil repeats:NO];
    start = [[NSDate alloc]init];
    
}

-(void)didComplete {
    
    if (_repeats) {
        
        float diff = [start timeIntervalSinceNow] - count;
        count -= _interval;
        
        timer = [NSTimer scheduledTimerWithTimeInterval:_interval + diff target:self selector:@selector(didComplete) userInfo:nil repeats:NO];
        
    }
    
    _block();
    
}

-(void)invalidate {
    [timer invalidate];
}

@end
