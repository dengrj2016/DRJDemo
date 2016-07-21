//
//  Pruduct.h
//  DRJStudyDemo
//
//  Created by Afmobi on 16/7/21.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pruduct : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)int price;

+(id)getInstance;
@end
