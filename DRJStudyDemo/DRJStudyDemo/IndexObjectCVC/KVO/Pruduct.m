//
//  Pruduct.m
//  DRJStudyDemo
//
//  Created by Afmobi on 16/7/21.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "Pruduct.h"

//static id instance=nil;
@implementation Pruduct

//+(id)getInstance{
//    if (!instance) {
//        instance=[[super alloc] init];
//    }
//    return instance;
//}

+ (id)getInstance{
    static id instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[self.class alloc]init];
    });
    return instance;
}

- (void)dealloc {
    // 永远不要调用这个方法
}

@end
