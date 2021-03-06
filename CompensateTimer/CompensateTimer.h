//
//  CompensateTimer.h
//  CompensateTimer
//
//  Created by Evan on 10/17/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompensateTimer : NSObject

-(void)setInterval:(float)interval repeats:(BOOL)repeats block:(void(^)(void))block;
-(void)setInterval:(NSTimeInterval)seconds target:(id)target selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)repeats;
-(void)invalidate;

@end
