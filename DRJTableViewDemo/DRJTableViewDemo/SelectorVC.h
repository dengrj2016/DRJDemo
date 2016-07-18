//
//  SelectorVC.h
//  DRJTableViewDemo
//
//  Created by Afmobi on 16/7/18.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SelectDeletage<NSObject>
-(void) returnSelected:(NSMutableArray*)array;
@end
@interface SelectorVC : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,unsafe_unretained) id<SelectDeletage> delegate;
@end