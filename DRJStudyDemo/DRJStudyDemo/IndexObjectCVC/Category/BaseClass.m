//
//  BaseClass.m
//  DRJStudyDemo
//
//  Created by Afmobi on 16/7/21.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "BaseClass.h"
#import <UIKit/UIKit.h>


@implementation BaseClass
-(void)setText:(id)sender{
    [(UILabel *)sender setText:@"BaseClass  setText"];
}
-(void)add:(id)sender{
    [(UILabel *)sender setText:@"BaseClass add"];
}
@end
