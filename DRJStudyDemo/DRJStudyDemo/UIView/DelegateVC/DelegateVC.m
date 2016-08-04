//
//  DelegateVC.m
//  DRJStudyDemo
//
//  Created by Afmobi on 16/8/1.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "DelegateVC.h"

@interface DelegateVC ()
@property (weak, nonatomic) IBOutlet UITextField *text1;
@property (weak, nonatomic) IBOutlet UITextField *text2;

@property (copy,nonatomic) ReturnTextBlock returnTextBlock;
@end

@implementation DelegateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)respond:(id)sender{
    NSString *first=self.text1.text;
    NSString *second=self.text2.text;
//    if(first!=nil && first.length>0 && second!=nil && second.length>0){
        if (self.type==TYPE_DELEGATE) {
//            [self.delegate returnData:first :second];
            if (self.delegate && [self.delegate respondsToSelector:@selector(returnData::)]) {
                //一定要判断代理是否响应代理的方法，避免忘记实现代理方法闪退的问题
                [self.delegate returnData:first :second];
            }
        }else if (self.type==TYPE_NOTIFICATION){
            NSNotification *noti=[NSNotification notificationWithName:@"return" object:nil userInfo:@{@"one":first,@"two":second}];
            [[NSNotificationCenter defaultCenter] postNotification:noti];
        }else if (self.type==TYPE_BLOCK){
            if(self.returnBlock) {      //这里一定要判断，避免忘记写block闪退
                self.returnBlock(first,second);
            }
        }
//    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (void)returnText:(ReturnTextBlock) block{
//    self.returnTextBlock=block;
//}

//- (void)viewWillDisappear:(BOOL)animated{
//    if (self.returnTextBlock!=nil) {
//        self.returnTextBlock(self.text1.text,self.text2.text);
//    }
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
