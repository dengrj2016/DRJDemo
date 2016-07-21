//
//  CategoryVC.m
//  DRJStudyDemo
//
//  Created by Afmobi on 16/7/21.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "CategoryVC.h"
#import "BaseClass+Category.h"
//#import "BaseClass.h"

@interface CategoryVC ()
@property(strong,nonatomic) IBOutlet UILabel*titleLabel;
@property(strong,nonatomic) IBOutlet UILabel*contextLabel;
//@property(strong,nonatomic) NSString *str;
//@property(strong,nonatomic) NSString *_str;
@end

@implementation CategoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.contextLabel.center=CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    BaseClass *cate=[[BaseClass alloc] init];
    [cate add:self.contextLabel];
    [cate setText:self.titleLabel];
    [self setValue:@"222" forKey:@"str"];
    NSLog(@"str->%@",self->str);
    NSLog(@"_str->%@",self->_str);
}

-(void)viewDidLayoutSubviews{
    self.titleLabel.center=CGPointMake(CGRectGetMidX(self.view.bounds), 50);
    [self.contextLabel sizeToFit];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
