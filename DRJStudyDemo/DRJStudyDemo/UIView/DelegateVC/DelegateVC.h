//
//  DelegateVC.h
//  DRJStudyDemo
//
//  Created by Afmobi on 16/8/1.
//  Copyright © 2016年 Afmobi. All rights reserved.
//
#define DELEGATE 223
#define NOTIFICATION 224


#import <UIKit/UIKit.h>
typedef void (^ReturnTextBlock)(NSString *str1,NSString *str2);
@protocol ReturnDelegate<NSObject>
- (void) returnData:(NSString *) one :(NSString *) two;
@end

@interface DelegateVC : UIViewController
@property(nonatomic) int type;
@property(nonatomic) id<ReturnDelegate> delegate;
- (void)returnText:(ReturnTextBlock) block;
@end
