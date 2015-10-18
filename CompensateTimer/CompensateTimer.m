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
    id _target;
    SEL _selector;
    float count;
    NSDate *start;
}

-(void)didComplete;
-(void)secondDidComplete:(NSTimer *)tempTimer;

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

-(void)setInterval:(NSTimeInterval)seconds target:(id)target selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)repeats {
    
    _interval = seconds;
    _target = target;
    _selector = aSelector;
    _repeats = repeats;
    
    count = 0;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(secondDidComplete:) userInfo:userInfo repeats:NO];
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

-(void)secondDidComplete:(NSTimer *)tempTimer {
    
    if (_repeats) {
        
        float diff = [start timeIntervalSinceNow] - count;
        count -= _interval;
        
        timer = [NSTimer scheduledTimerWithTimeInterval:_interval + diff target:self selector:@selector(secondDidComplete:) userInfo:tempTimer.userInfo repeats:NO];
        
    }
    
    [_target performSelector:_selector withObject:tempTimer];
    
}

-(void)invalidate {
    [timer invalidate];
}

@end
