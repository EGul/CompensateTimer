# CompensateTimer

CompensateTimer prevents timer drift

## Usage
```objective-c
CompensateTimer *compensateTimer = [[CompensateTimer alloc]init];

[compensateTimer setInterval:5.0 repeats:true block: ^ {
  NSLog(@"something");
}];
```

## API

### -(void)setInterval:(float)interval repeats:(BOOL)repeats block:(void (^)(void))block;

Set the compensate timer

#### interval

`float`

The time interval

#### repeats

`BOOL`

Whether or not the timer should repeat

#### block

`block`

The completion block

### -(void)setInterval:(NSTimeInterval)seconds target:(id)target selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)repeats;

Set the compensate timer

#### seconds

`float`

The time interval

#### target

`id`

The target

#### aSelector

`SEL`

The selector

#### userInfo

`id`

The user info

#### repeats

`BOOL`

Whether or not the timer repeats

### -(void)invalidate

Invalidate the timer

## Install
```
git clone https://github.com/egul/compensatetimer
```
Move CompensateTimer.h,m to project

## License

MIT
