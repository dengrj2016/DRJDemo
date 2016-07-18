//
//  SingleSelector.m
//  TableViewDemo
//
//  Created by Afmobi on 16/7/13.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "SingleSelector.h"

@interface SingleSelector ()


@end

@implementation SingleSelector
NSArray *array;
UITableView *tableView;
NSIndexPath *lastIndex;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *view=[[UIView alloc] initWithFrame:self.view.frame];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    array=@[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天"];
    //    self.table=[[UITableView alloc] init];     20+self.navigationController.navigationBar.frame.size.height
    tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TableSampleIdentifier = @"SingleSelector";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TableSampleIdentifier];
    }
    //    for (int i=0; i<array.count; i++) {
    cell.textLabel.text=[array objectAtIndex:indexPath.row];
    //    }
    /**
     这里是默认选中
     if (lastIndex == indexPath.row) {
     cell.accessoryType = UITableViewCellAccessoryCheckmark;
     } else {
     cell.accessoryType = UITableViewCellAccessoryNone;
     }
     */
    if (indexPath==lastIndex) {
        // 选中操作
//        UITableViewCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        // 取消前一个选中的，就是单选啦
//        UITableViewCell *lastCell = [tableView cellForRowAtIndexPath:lastIndex];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger newRow=indexPath.row;
    NSInteger lastRow=lastIndex!=nil?lastIndex.row:-1;
    if (newRow!=lastRow) {
        // 取消前一个选中的，就是单选啦
        UITableViewCell *lastCell = [tableView cellForRowAtIndexPath:lastIndex];
        lastCell.accessoryType = UITableViewCellAccessoryNone;
        
        // 选中操作
        UITableViewCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    lastIndex=indexPath;
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
