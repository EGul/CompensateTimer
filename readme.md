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
```objective-c
-(void)setInterval:(float)interval repeats:(BOOL)repeats block:(void (^)(void))block;
```

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

```objective-c
-(void)setInterval:(NSTimeInterval)seconds target:(id)target selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)repeats;
```

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

```objective-c
-(void)invalidate
```

Invalidate the timer

## Install

### CocoaPods

#### Podfile

```
pod "CompensateTimer", :git => "https://github.com/egul/compensatetimer"
```

### Manual

```
git clone https://github.com/egul/compensatetimer
```
Move CompensateTimer.h,m to project

## License

MIT
