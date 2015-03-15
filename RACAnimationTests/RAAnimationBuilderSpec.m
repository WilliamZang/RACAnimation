//
//  RAAnimationBuilderSpec.m
//  RACAnimation
//
//  Created by ZangChengwei on 15/3/16.
//  Copyright 2015年 ZangChengwei. All rights reserved.
//

#import "Specta.h"
#import "RAAnimationBuilder.h"


SpecBegin(RAAnimationBuilder)

describe(@"RAAnimationBuilder", ^{
    
    beforeAll(^{

    });
    
    beforeEach(^{

    });

    it(@"", ^{
        waitUntil(^(DoneCallback done) {
            [[[[RAAnimationBuilder new] setDuration:2] buildAnimationSignal] subscribeNext:^(id x) {
                NSLog(@"%@", x);
            } completed:^{
                done();
            }];
        });
        
    });  
    
    afterEach(^{

    });
    
    afterAll(^{

    });
});

SpecEnd
