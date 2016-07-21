//
//  BaseClass+Caterory.m
//  DRJStudyDemo
//
//  Created by Afmobi on 16/7/21.
//  Copyright © 2016年 Afmobi. All rights reserved.
//
#import"BaseClass+Category.h"
#import <UIKit/UIKit.h>

@implementation BaseClass (Category)
-(void)add:(id)sender{
    [(UILabel *)sender setText:@"BaseClassCaterory  add 覆盖基类add方法"];
}
@end
