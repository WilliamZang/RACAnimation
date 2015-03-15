//
//  RAAnimationBuilder.m
//  Pods
//
//  Created by ZangChengwei on 15/3/16.
//
//

#import "RAAnimationBuilder.h"
#import <CoreGraphics/CoreGraphics.h>

@interface RAAnimationBuilder()

@property (nonatomic, assign) NSTimeInterval _duration;
@property (nonatomic, copy) TimingFunction _timingFunction;
@property (nonatomic, copy) ValueTransfer _valueTransfer;

@end

@implementation RAAnimationBuilder

- (instancetype) init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)setDuration:(NSTimeInterval)duration
{
    self._duration = duration;
    return self;
}

- (instancetype)setTimingFunction:(TimingFunction)timingFunction
{
    self._timingFunction = timingFunction;
    return self;
}

- (instancetype)setValueTransfer:(ValueTransfer)valueTransfer
{
    self._valueTransfer = valueTransfer;
    return self;
}


- (RACSignal *)buildAnimationSignal
{
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkCallback:)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    RACSignal *currentTime = [RACSignal defer:^RACSignal *{
        return [RACSignal return:@(CACurrentMediaTime())];
    }];
    RACSubject *takeSubject = [RACSubject subject];
    return [[[[[[[[self rac_signalForSelector:@selector(displayLinkCallback:)]
               takeUntil:takeSubject]
              map:^id(RACTuple *values) {
                  CADisplayLink *displayLink = values.first;
                  return @(displayLink.timestamp);
              }] combineLatestWith:currentTime] map:^id(RACTuple *value) {
                  CFTimeInterval nowTime = [value.first doubleValue];
                  CFTimeInterval startTime = [value.second doubleValue];
                  
                  return @(nowTime - startTime);
              }] doNext:^(NSNumber *duration) {
                  if (duration.doubleValue > self._duration) {
                      [takeSubject sendNext:nil];
                  }
              }] doCompleted:^{
                  [link invalidate];
              }] map:^id(NSNumber *duration) {
                  double percent = 0.0;
                  if (duration.doubleValue > self._duration) {
                      percent = 1.0;
                  } else {
                      percent = duration.doubleValue / self._duration;
                  }
                  return @(percent);
              }];
}

- (void)displayLinkCallback:(CADisplayLink *)displayLink {}
@end
