//
//  RAAnimationBuilder.h
//  Pods
//
//  Created by ZangChengwei on 15/3/16.
//
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>


typedef NSNumber *(^TimingFunction)(NSNumber *animationPercent);
typedef id(^ValueTransfer)(NSNumber *);

@interface RAAnimationBuilder : NSObject

- (instancetype)init;

- (instancetype)setDuration:(NSTimeInterval)duration;
- (instancetype)setTimingFunction:(TimingFunction)timingFunction;
- (instancetype)setValueTransfer:(ValueTransfer)valueTransfer;


- (RACSignal *)buildAnimationSignal;

@end
