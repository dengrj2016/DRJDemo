//
//  Pruduct.m
//  DRJStudyDemo
//
//  Created by Afmobi on 16/7/21.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "Pruduct.h"

static id instance=nil;
@implementation Pruduct

+(id)getInstance{
    if (!instance) {
        instance=[[super alloc] init];
    }
    return instance;
}
@end
