//
//  IndexVC.m
//  DRJViewControllerDemo
//
//  Created by Frank Du on 16/7/19.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "IndexVC.h"
#import "XibVC.h"
#import "CodeVC.h"

@interface IndexVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation IndexVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellReuse";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *text;
    if (indexPath.row == 0) {
        text = @"Storyboard创建初始化VC";
    }else if (indexPath.row == 1) {
        text = @"Xib创建初始化VC";
    }else if (indexPath.row == 2) {
        text = @"代码创建初始化VC";
    }
    
    cell.textLabel.text = text;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"StoryboardVC" bundle:nil];
        UIViewController *controller=[storyBoard instantiateViewControllerWithIdentifier:@"storyBoardVC"];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 1) {
        XibVC *vc=[[XibVC alloc] initWithNibName:@"XibVC" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2) {
        CodeVC *vc=[[CodeVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
