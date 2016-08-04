//
//  CustomLoadingVC.m
//  DRJStudyDemo
//
//  Created by Afmobi on 16/8/3.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "CustomLoadingVC.h"
#import "LoadingView.h"

@interface CustomLoadingVC ()
@property(nonatomic,strong) LoadingView *loading;
@property (weak, nonatomic) IBOutlet LoadingView *loadingView;

@end

@implementation CustomLoadingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
//    self.loading=[[LoadingView alloc] initWithFrame:CGRectMake(100, 100, 40, 40)];
//    [self.view addSubview:self.loading];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)start:(id)sender {
    if (self.loadingView.isAnimating) {
        [self.loadingView stopAnimating];
    }else{
        [self.loadingView startAnimating];
    }
    
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
