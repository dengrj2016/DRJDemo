//
//  IndexVC.m
//  DRJViewControllerDemo
//
//  Created by Frank Du on 16/7/19.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "IndexVC.h"
#import "CodeVC.h"
#import "AutolayoutSplitVC.h"
#import "AutolayoutSubviewsVC.h"
#import "AutolayoutMultiplierVC.h"

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
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellReuse";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *text;
    if (indexPath.row == 0) {
        text = @"代码适配";
    }else if (indexPath.row == 1) {
        text = @"简单Autolayout适配";
    }else if (indexPath.row == 2) {
        text = @"包含子View的Autolayout适配";
    }else if (indexPath.row == 3) {
        text = @"固定比例Autolayout适配";
    }else if (indexPath.row == 4) {
        text = @"等分屏幕Autolayout适配";
    }
    
    cell.textLabel.text = text;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        //CodeVC
    }else if (indexPath.row == 1) {
        //AutolayoutCommonVC
    }else if (indexPath.row == 2) {
        //AutolayoutSubviewsVC
    }else if (indexPath.row == 3) {
        //AutolayoutMultiplierVC
    }else if (indexPath.row == 4) {
        //AutolayoutSplitVC
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
