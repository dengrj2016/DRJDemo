//
//  LoadingArc.m
//  DRJStudyDemo
//
//  Created by Afmobi on 16/8/3.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "LoadingArc.h"

@implementation LoadingArc

#pragma mark - Init
- (void)commonInit {
    self.backgroundColor = [UIColor clearColor];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self setNeedsDisplay];
}

#pragma mark - Draw
- (void)drawRect:(CGRect)rect {
    CGRect frame = self.frame;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, kArcLineWidth);//线的宽度
    CGContextSetLineCap(context, kCGLineCapRound);//线头形状
    CGContextSetStrokeColorWithColor(context, kArcColor.CGColor);
    CGContextAddArc(context, CGRectGetWidth(frame) / 2.0, CGRectGetHeight(frame) / 2.0, kArcRadius, - 0.5  * M_PI + 0.0 * (M_PI / 180.0),  - 0.5  * M_PI + 60.0 * (M_PI / 180.0), 0);
    CGContextDrawPath(context, kCGPathStroke); //绘制路径
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
