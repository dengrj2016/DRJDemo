//
//  SingleSelector.m
//  TableViewDemo
//
//  Created by Afmobi on 16/7/13.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "SingleSelectorVC.h"
#import "CustomCell.h"

@interface SingleSelectorVC ()
@property(strong,nonatomic) NSArray *array;
@property(strong,nonatomic) UITableView *tableView;
@property(strong,nonatomic) NSIndexPath *lastIndex;

@end

@implementation SingleSelectorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *view=[[UIView alloc] initWithFrame:self.view.frame];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    self.array=[[UIFont familyNames] copy];
//    self.array=@[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天"];
    //    self.table=[[UITableView alloc] init];     20+self.navigationController.navigationBar.frame.size.height
    self.tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64.0) style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TableSampleIdentifier = @"SingleSelector";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TableSampleIdentifier];
    }
    cell.titleLabel.text=[self.array objectAtIndex:indexPath.row];
    NSString *row=[NSString stringWithFormat:@"CustomCell  %ld",indexPath.row];
    cell.contentLabel.text=row;
//    cell.textLabel.text=[self.array objectAtIndex:indexPath.row];
    /**
     这里是默认选中
     if (lastIndex == indexPath.row) {
     cell.accessoryType = UITableViewCellAccessoryCheckmark;
     } else {
     cell.accessoryType = UITableViewCellAccessoryNone;
     }
     */
    if (indexPath==self.lastIndex) {
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
    NSInteger lastRow=self.lastIndex!=nil?self.lastIndex.row:-1;
    if (newRow!=lastRow) {
        // 取消前一个选中的，就是单选啦
        UITableViewCell *lastCell = [tableView cellForRowAtIndexPath:self.lastIndex];
        lastCell.accessoryType = UITableViewCellAccessoryNone;
        
        // 选中操作
        UITableViewCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    self.lastIndex=indexPath;
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
