//
//  ViewControllerDemo1.m
//  DRJTableViewDemo
//
//  Created by Afmobi on 16/7/18.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "ViewControllerDemo1.h"
#import "ThreeVC.h"


@interface ViewControllerDemo1 ()

@end

@implementation ViewControllerDemo1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(20, 150, 80, 44)];
    //    button.titleLabel.text=@"three";
    
    [button setTitle:@"three" forState:UIControlStateNormal];
    [button setTitle:@"three 2" forState:UIControlStateHighlighted];
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)click:(id)sender{
    ThreeVC *vc=[[ThreeVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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