//
//  ThreeVC.m
//  TableViewDemo
//
//  Created by Afmobi on 16/7/13.
//  Copyright © 2016年 Afmobi. All rights reserved.
//
#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height
#import "ThreeVC.h"


@interface ThreeVC ()
@property(nonatomic,strong)UILabel *label;
@end

@implementation ThreeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    UIView *view=[[UIView alloc] initWithFrame:self.view.frame];
    self.view.backgroundColor = [UIColor whiteColor];
    //    [self.view addSubview:view];
    self.label=[[UILabel alloc] init];
    [self.label setText:@"Three"];
    self.label.backgroundColor = [UIColor grayColor];
    self.label.frame = CGRectMake(50, 50, 80, 44);
    //    self.label.center=CGPointMake(50, 50);
    //    self.label.adjustsFontSizeToFitWidth=YES;
    //    self.label.frame=CGRectMake(50, 50, 100, 9999);
    self.label.numberOfLines=0;
    [self.label sizeToFit];
    
    UIButton *selector=[[UIButton alloc] initWithFrame:CGRectMake(180, 5, 80, 44)];
    selector.backgroundColor = [UIColor clearColor];
    [selector addTarget:self action:@selector(selected:) forControlEvents:(UIControlEventTouchUpInside)];
    [selector setTitle:@"Select" forState:UIControlStateNormal];
    [selector setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:self.label];
    [self.view addSubview:selector];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)selected:(id)sender{
    SelectorVC *pick=[[SelectorVC alloc] initWithNibName:@"SelectorVC" bundle:nil];
    pick.delegate=self;
    pick.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0) {
        pick.modalPresentationStyle=UIModalPresentationOverCurrentContext;
    }else{
        self.modalPresentationStyle=UIModalPresentationCurrentContext;
    }
    [self presentViewController:pick animated:YES completion:nil];
}

-(void)returnSelected:(NSMutableArray *)arrays{
    NSString *str=@"你选了 ";
    for (int i=0; i<arrays.count; i++) {
        str=[str stringByAppendingString:[arrays objectAtIndex:i]];
    }
    
    [self.label setText:str];
    
    //    UILabel *textLabel = [[UILabel alloc] init];
    self.label.font = [UIFont systemFontOfSize:16];
    //    NSString *str = @"222222222222222222222222222222222222222222";
    self.label.text = str;
    //    self.label.backgroundColor = [UIColor redColor];
    self.label.numberOfLines = 0;//根据最大行数需求来设置
    self.label.lineBreakMode = NSLineBreakByTruncatingTail;
    CGSize maximumLabelSize = CGSizeMake(200, 9999);//labelsize的最大值
    //关键语句
    CGSize expectSize = [self.label sizeThatFits:maximumLabelSize];
    //别忘了把frame给回label，如果用xib加了约束的话可以只改一个约束的值
    self.label.frame = CGRectMake(50, 50, expectSize.width, expectSize.height);
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
