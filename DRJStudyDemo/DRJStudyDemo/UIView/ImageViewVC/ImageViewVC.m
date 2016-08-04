//
//  ImageViewVC.m
//  DRJStudyDemo
//
//  Created by Afmobi on 16/8/1.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "ImageViewVC.h"

@interface ImageViewVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic) NSArray *images;

@property (nonatomic) int curentImage;
@property (nonatomic) CGFloat *alpha;
@property (strong,nonatomic) NSTimer *timer;
@end

@implementation ImageViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //幻灯片 播放器
    /*
    self.images=[NSArray arrayWithObjects:[UIImage imageNamed:@"i4-GuidePage1"],[UIImage imageNamed:@"i4-GuidePage2"],[UIImage imageNamed:@"i4-GuidePage3"], nil];
    self.imageView.animationImages=self.images;
    self.imageView.animationDuration=5;
    self.imageView.animationRepeatCount=99999;
    [self.imageView startAnimating];
     */
    //图片浏览
//    self.curentImage=0;
//    self.alpha=0;
//    self.images=[NSArray arrayWithObjects:[UIImage imageNamed:@"i4-GuidePage1"],[UIImage imageNamed:@"i4-GuidePage2"],[UIImage imageNamed:@"i4-GuidePage3"], nil];
//    //创建一个轻击的手势检测器
//    UITapGestureRecognizer *singleTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
//    [self.imageView addGestureRecognizer:singleTap];
    
    self.imageView.image=[UIImage animatedImageNamed:@"i4-GuidePage" duration:0.6];
    self.timer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(change) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)click:(UITapGestureRecognizer *) sender{
    UIImage *srcImage=self.imageView.image;
    CGPoint pt=[sender locationInView:self.imageView];//获取在控件上的触碰点
    CGImageRef sourceImage=[srcImage CGImage];
    CGFloat scale=srcImage.size.width/320;
    CGFloat x=pt.x*scale;
    CGFloat y=pt.y*scale;
    if (x+120 > srcImage.size.width) {
        x=srcImage.size.width-140;
    }
    if (y+120 > srcImage.size.height) {
        y=srcImage.size.height-140;
    }
}

- (void)change{
    CGPoint curPos=self.imageView.center;
    int y=arc4random() % 10 - 5;
//    if (curPos.x > [UIScreen mainScreen].bounds.size.width) {
//        self.imageView.center=CGPointMake(0, 30);
//    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
