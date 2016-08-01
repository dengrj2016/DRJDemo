//
//  ViewController.m
//  DRJStudyDemo
//
//  Created by Afmobi on 16/7/21.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "IndexVC.h"
#import "IndexObjectCVC.h"
#import "NotificationVC/NotificationVC.h"
#import "ScrollViewVC.h"
#import "TextFieldVC.h"

@interface IndexVC ()
@property(strong,nonatomic) IBOutlet UITableView *table;
@end

@implementation IndexVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Index";
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    if (indexPath.row==0) {
        cell.textLabel.text=@"Object-c";
    }else if (indexPath.row==1){
        cell.textLabel.text=@"Notification";
    }else if (indexPath.row==2){
        cell.textLabel.text=@"UIScrollView";
    }else if (indexPath.row==3){
        cell.textLabel.text=@"TextFieldVC+数值回传";
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            IndexObjectCVC *vc=[[IndexObjectCVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:{
            NotificationVC *vc=[[NotificationVC alloc] initWithNibName:@"NotificationVC" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:{
            ScrollViewVC *vc=[[ScrollViewVC alloc] initWithNibName:@"ScrollViewVC" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:{
            TextFieldVC *vc=[[TextFieldVC alloc] initWithNibName:@"TextFieldVC" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        default:
            break;
    }
}

@end
