//
//  NotificationVC.m
//  DRJStudyDemo
//
//  Created by Afmobi on 16/7/28.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "NotificationVC.h"

#define PROGRESS_CHANGE @"down_progress_changed"

@interface NotificationVC ()
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIButton *beginButton;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property(nonatomic,strong) NSNotificationCenter *center;
@property(strong,nonatomic) NSOperationQueue *queue;
@end

@implementation NotificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.center=[NSNotificationCenter defaultCenter];
    self.queue=[[NSOperationQueue alloc] init];
    self.queue.maxConcurrentOperationCount=10;
    self.label=[self.view viewWithTag:55];
    
    [self.center addObserver:self selector:@selector(update:) name:PROGRESS_CHANGE object:nil];
}
- (void)viewDidLayoutSubviews{
    self.progressView.center=CGPointMake(180, 80);
    self.beginButton.center=CGPointMake(180, 130);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender{
    __block int progStatus=0;
    [sender setEnabled:NO];
    NSBlockOperation *operation=[NSBlockOperation blockOperationWithBlock:^{
        for(int i=0;i<100;i++){
            [NSThread sleepForTimeInterval:0.01];
//            progStatus+=1;
            NSNotification *noti=[NSNotification notificationWithName:PROGRESS_CHANGE object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:++progStatus],@"prog", nil]];
            [self.center postNotification:noti];
        }
    }];
    [self.queue addOperation:operation];

}

- (void)update:(NSNotification *)noti{
    NSNumber *progStatus=noti.userInfo[@"prog"];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.progress = progStatus.intValue/100.0;// progress是float类型，右边也必须是float
        NSLog(@"progStatus.intValue=%d----self.progressView.progress=%f",progStatus.intValue,self.progressView.progress);
        NSString *str=[NSString stringWithFormat:@"%f",self.progressView.progress];
        [self.label setText:str];
        if (progStatus.intValue==100) {
            [self.beginButton setEnabled:YES];
        }
    });
//    [self performSelectorOnMainThread:@selector(updateUI:) withObject:progStatus waitUntilDone:YES];
}

//- (void)dealloc{
//    [self.center removeObserver:PROGRESS_CHANGE];
//}

//最优的方法，在 UIViewController.m 中：

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



//单个移除：
//-(void)dealloc {
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:PROGRESS_CHANGE object:nil];
//}

//- (void)updateUI:(id)sender{
//    NSNumber *progStatus=sender;
//    self.progressView.progress=progStatus.intValue/100;
//    if (progStatus.intValue==100) {
//        [self.beginButton setEnabled:YES];
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
