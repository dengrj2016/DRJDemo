//
//  SectionsVC.m
//  TableViewDemo
//
//  Created by Afmobi on 16/7/13.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "SectionsVC.h"

@interface SectionsVC ()

@property (nonatomic,strong) UITableView *table;
@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong) NSMutableArray *arrayIndexs;

@end

@implementation SectionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.table];
    self.array=@[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天"];
    self.arrayIndexs=[[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView *)table{
    if (!_table) {
        self.table=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStyleGrouped];
        self.table.delegate=self;
        self.table.dataSource=self;
    }
    return _table;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 5;
            break;
            
        default:
            return 2;
            break;
    }
    //    return self.array.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TableSampleIdentifier = @"SingleSelector";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TableSampleIdentifier];
    }
    //    for (int i=0; i<array.count; i++) {
    NSInteger sectionID=indexPath.section;
    if (sectionID==0) {
        cell.textLabel.text=[self.array objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text=[self.array objectAtIndex:indexPath.row+5];
    }
    
    //    }
    /**
     这里是默认选中
     if (lastIndex == indexPath.row) {
     cell.accessoryType = UITableViewCellAccessoryCheckmark;
     } else {
     cell.accessoryType = UITableViewCellAccessoryNone;
     }
     */
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    NSInteger newRow=indexPath.row;
    //    NSInteger lastRow=lastIndex!=nil?lastIndex.row:-1;
    
    if ([self.arrayIndexs indexOfObject:indexPath ]== NSNotFound) {
        // 选中操作
        UITableViewCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.arrayIndexs addObject:indexPath];
    }else{
        // 取消前一个选中的
        UITableViewCell *lastCell = [tableView cellForRowAtIndexPath:indexPath];
        lastCell.accessoryType = UITableViewCellAccessoryNone;
        [self.arrayIndexs removeObject:indexPath];
    }
}

-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return @[@"工作日",@"休息日"];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"工作日";
            break;
            
        default:
            return @"休息日";
            break;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"共5天";
            break;
            
        default:
            return @"共2天";
            break;
    }
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
