//
//  XibVC.m
//  DRJViewControllerDemo
//
//  Created by Afmobi on 16/7/19.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "XibVC.h"

@interface XibVC ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation XibVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad self.label.frame == %@", NSStringFromCGRect(self.label.frame));
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSLog(@"viewWillLayoutSubviews self.label.frame == %@", NSStringFromCGRect(self.label.frame));
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSLog(@"viewDidLayoutSubviews self.label.frame == %@", NSStringFromCGRect(self.label.frame));
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
