//
//  TextFieldVC.m
//  DRJStudyDemo
//
//  Created by Afmobi on 16/7/29.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "TextFieldVC.h"


@interface TextFieldVC ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UITextField *text1;
@property (weak, nonatomic) IBOutlet UITextField *text2;

@property (weak, nonatomic) IBOutlet UITextField *other;

@property (strong,nonatomic) NSNotificationCenter *center;
@end

@implementation TextFieldVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIToolbar *toolBar=[[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    [toolBar setBarStyle:UIBarStyleDefault];
    
//    UIBarButtonItem *firstButton=[[UIBarButtonItem alloc] initWithTitle:@"Button" style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem *secondButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];//这是一片空白，为了让done显示在右边
    UIBarButtonItem *threeButton=[[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(closeKeyBoard)];
    
    NSArray *buttonsArray=[NSArray arrayWithObjects:secondButton,threeButton, nil];
    [toolBar setItems:buttonsArray];
    //为textView关联的虚拟键盘设置附件
    [self.userName setInputAccessoryView:toolBar];
    [self.passWord setInputAccessoryView:toolBar];
    [self.text2 setInputAccessoryView:toolBar];
    [self.text1 setInputAccessoryView:toolBar];
    [self.other setInputAccessoryView:toolBar];
    
    self.center=[NSNotificationCenter defaultCenter];
    [self.center addObserver:self selector:@selector(notificationReturn:) name:@"return" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Did End On Exit.   可以把view背景的class改为UIControl，view就有Touch Down事件
- (IBAction)closeKeyBoard{
    [self.userName resignFirstResponder];
    [self.passWord resignFirstResponder];
    [self.other resignFirstResponder];
    [self.text1 resignFirstResponder];
    [self.text2 resignFirstResponder];
}

- (IBAction)actionDelegate:(id)sender{
    DelegateVC *vc=[[DelegateVC alloc] initWithNibName:@"DelegateVC" bundle:nil];
    vc.delegate=self;
    vc.type=TYPE_DELEGATE;
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)actionNotification:(id)sender{
    DelegateVC *vc=[[DelegateVC alloc] initWithNibName:@"DelegateVC" bundle:nil];
    vc.type=TYPE_NOTIFICATION;
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)actionBlock:(id)sender{
    DelegateVC *vc=[[DelegateVC alloc] initWithNibName:@"DelegateVC" bundle:nil];
    //    [vc returnText:^(NSString *str1,NSString *str2){
    //        [self.text1 setText:str1];
    //        [self.text2 setText:str2];
    //    }];
    vc.type = TYPE_BLOCK;
    vc.returnBlock = ^(NSString *first,NSString *second){
        [self.text1 setText:first];
        [self.text2 setText:second];
    };
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)returnData:(NSString *)one :(NSString *)two{
    [self.text1 setText:one];
    [self.text2 setText:two];
}

- (void)notificationReturn:(id)sender{
    NSLog(@"%@",sender);
    [self.text1 setText:((NSNotification *)sender).userInfo[@"one"]];
    [self.text2 setText:((NSNotification *)sender).userInfo[@"two"]];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
