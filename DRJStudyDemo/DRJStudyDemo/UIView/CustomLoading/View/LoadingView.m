//
//  LoadingView.m
//  DRJStudyDemo
//
//  Created by Afmobi on 16/8/3.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "LoadingView.h"
#import "LoadingArc.h"
#define kCircleColor      [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]
@interface LoadingView()
//@property (strong,nonatomic) UIImageView *circleImageView;
//@property (strong,nonatomic) UIImageView *arcImageView;

@property (nonatomic,assign) BOOL isAnimating;
@property (nonatomic, strong) LoadingArc *arc;
@end
@implementation LoadingView

- (void)initView{
//    self.isAnimating = NO;
    
//    self.circleImageView=[[UIImageView alloc] init];
//    self.circleImageView.image=[UIImage imageNamed:@"LoadingCircle"];
//    [self addSubview:self.circleImageView];
//    
//    self.arcImageView=[[UIImageView alloc] init];
//    self.arcImageView.image=[UIImage imageNamed:@"LoadingArc"];
//    [self addSubview:self.arcImageView];
    
    self.arc = [[LoadingArc alloc] init];
    [self addSubview:self.arc];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.arc.frame=self.bounds;
//    self.arcImageView.frame=self.bounds;
}

#pragma mark - Animating
- (void)startAnimating {
    self.hidden = NO;
    
    if (!self.isAnimating) {
        CABasicAnimation *rotationAnimation;
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0];
        rotationAnimation.duration = 1.0;
        rotationAnimation.cumulative = YES;
        rotationAnimation.repeatCount = HUGE_VALF;
        [self.arc.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
        
        self.isAnimating = YES;
    }
}

- (void)stopAnimating {
    if (self.isAnimating) {
        [self.arc.layer removeAnimationForKey:@"rotationAnimation"];
        
        self.isAnimating = NO;
    }
    
//    if (self.hidesWhenStopped) {
//        self.hidden = YES;
//    }
}

#pragma mark - Draw
/*
 CGContextRef c:上下文
 CGFloat x ：x，y圆弧所在圆的中心点坐标
 CGFloat y ：x，y圆弧所在圆的中心点坐标
 CGFloat radius ：所在圆的半径
 CGFloat startAngle ： 圆弧的开始的角度  单位是弧度  0对应的是最右侧的点；
 CGFloat endAngle  ： 圆弧的结束角度
 int clockwise ： 顺时针（0） 或者 逆时针(1)
 */
- (void)drawRect:(CGRect)rect {
    CGRect frame = self.frame;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //开始绘制轨迹圆
    CGContextSetStrokeColorWithColor(context, kCircleColor.CGColor);
    CGContextSetLineWidth(context, kArcLineWidth);//线的宽度
//    CGContextSetLineWidth(context, kArcRadius);//线的宽度
    CGContextAddArc(context, CGRectGetWidth(frame) / 2.0, CGRectGetHeight(frame) / 2.0, kArcRadius, 0, 2 * M_PI, 0);
//    CGContextDrawPath(context, kCGPathStroke); //绘制路径
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
