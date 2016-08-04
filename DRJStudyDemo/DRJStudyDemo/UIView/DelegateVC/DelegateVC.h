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
//可以定义一个枚举
typedef NS_ENUM(NSInteger,returnValueType) {
    TYPE_DELEGATE=1,
    TYPE_BLOCK,
    TYPE_NOTIFICATION,
};
typedef void (^ReturnTextBlock)(NSString *str1,NSString *str2);

@protocol ReturnDelegate<NSObject>
- (void) returnData:(NSString *) one :(NSString *) two;
@end

@interface DelegateVC : UIViewController
@property(nonatomic) int type;
@property(nonatomic) id<ReturnDelegate> delegate;//声明delegate时请用assign(MRC)或者weak(ARC)，千万别手贱玩一下retain或者strong，毕竟这基本逃不掉循环引用了！
//- (void)returnText:(ReturnTextBlock) block;
//block属性修饰，如何避免循环引用可以百度一下
@property (nonatomic,copy) ReturnTextBlock returnBlock;
@end
