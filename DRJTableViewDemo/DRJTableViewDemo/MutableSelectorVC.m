//
//  MutableSelector.m
//  TableViewDemo
//
//  Created by Afmobi on 16/7/13.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "MutableSelectorVC.h"

@interface MutableSelectorVC ()

@property (nonatomic,strong) UITableView *table;
@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong) NSMutableArray *arrayIndexs;

@end

@implementation MutableSelectorVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.table=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    self.table.delegate=self;
    self.table.dataSource=self;
    [self.view addSubview:self.table];
//    self.array=@[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天"];
    self.array=[[UIFont familyNames] copy];
    self.arrayIndexs=[[NSMutableArray alloc] init];
    
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
    static BOOL isRegist=NO;
    if (!isRegist) {
        UINib *nib=[UINib nibWithNibName:@"XibCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:TableSampleIdentifier];
        isRegist=YES;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TableSampleIdentifier];
//    }
    UILabel *title=[cell viewWithTag:201];
    title.text=[self.array objectAtIndex:indexPath.row];
    UILabel *content=[cell viewWithTag:202];
    NSString *row=[NSString stringWithFormat:@"CustomCell  %ld",indexPath.row];
    content.text=row;
//    cell.textLabel.text=[self.array objectAtIndex:indexPath.row];
    if ([self.arrayIndexs indexOfObject:indexPath ]!= NSNotFound) {
        // 选中操作
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        // 取消前一个选中的
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
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

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
