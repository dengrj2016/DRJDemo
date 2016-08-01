//
//  ScrollViewVC.m
//  DRJStudyDemo
//
//  Created by Afmobi on 16/7/29.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "ScrollViewVC.h"

@interface ScrollViewVC ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong,nonatomic) UIBarButtonItem *done;
@end

@implementation ScrollViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.textView.delegate=self;
//    UINavigationBar *navBar=[[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, 320, 44)];
    [self.navigationItem setTitle:@"Title"];
    self.done=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(closeKeyBoard)];
    
    UIToolbar *toolBar=[[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    [toolBar setBarStyle:UIBarStyleDefault];
    
    UIBarButtonItem *firstButton=[[UIBarButtonItem alloc] initWithTitle:@"Button" style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem *secondButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];//这是一片空白，为了让done显示在右边
    UIBarButtonItem *threeButton=[[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(closeKeyBoard)];
    
    NSArray *buttonsArray=[NSArray arrayWithObjects:secondButton,threeButton, nil];
    [toolBar setItems:buttonsArray];
    //为textView关联的虚拟键盘设置附件
    [self.textView setInputAccessoryView:toolBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    self.navigationItem.rightBarButtonItem=self.done;
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    self.navigationItem.rightBarButtonItem=nil;
}

- (void)closeKeyBoard{
    [self.textView resignFirstResponder];
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
