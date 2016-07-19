//
//  ViewController.m
//  TableViewDemo
//
//  Created by Afmobi on 16/7/12.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "MainViewControllerVC.h"
#import "DelegateVC.h"
#import "SingleSelectorVC.h"
#import "MutableSelectorVC.h"
#import "SectionsVC.h"
#import "EditVC.h"

@interface MainViewControllerVC ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation MainViewControllerVC
//UINavigationController *navigation;
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TableSampleIdentifier];
//    }
    NSString *identifier=@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    UILabel *label=[cell viewWithTag:101];
    label.text=@"storyboardCell";
    UILabel *title=[cell viewWithTag:100];
    if (indexPath.row == 0) {
//        cell.textLabel.text = @"Delegate";
        title.text= @"Delegate";
    }else if (indexPath.row == 1) {
//        cell.textLabel.text = @"SingleSelector";
        title.text = @"SingleSelector";
    }else if (indexPath.row == 2) {
//        cell.textLabel.text = @"MutableSelector";
        title.text = @"MutableSelector";
    }else if (indexPath.row==3){
//        cell.textLabel.text=@"Sections";
        title.text=@"Sections";
    }else if(indexPath.row==4){
//        cell.textLabel.text=@"Edit";
        title.text=@"Edit";
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    switch (indexPath.row) {
        case 0: {
            DelegateVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"Demo1VC"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1: {
            SingleSelectorVC *vc = [[SingleSelectorVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:{
            MutableSelectorVC *vc=[[MutableSelectorVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:{
            SectionsVC *vc=[[SectionsVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 4:{
            EditVC *vc=[[EditVC alloc] initWithNibName:@"EditVC" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        default:
            break;
    }
}
@end
