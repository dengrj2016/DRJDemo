//
//  LoadingView.h
//  DRJStudyDemo
//
//  Created by Afmobi on 16/8/3.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView
@property (nonatomic,assign,readonly) BOOL isAnimating;

- (void)startAnimating;
- (void)stopAnimating;
@end
