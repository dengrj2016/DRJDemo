//
//  SelectorVC.m
//  TableViewDemo
//
//  Created by Afmobi on 16/7/15.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "SelectorVC.h"

@interface SelectorVC ()
@property(nonatomic,strong)IBOutlet UITableView *table;
@property(nonatomic,strong)IBOutlet UIButton *cancel;
@property(nonatomic,strong)IBOutlet UIButton *deno;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)NSMutableArray *selectedArray;
@end

@implementation SelectorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.table.delegate=self;
    self.table.dataSource=self;
    self.array=[[NSMutableArray alloc] init];
    self.selectedArray=[[NSMutableArray alloc] init];
    NSString *str;
    for (int i=0; i<31; i++) {
        str=[NSString stringWithFormat:@"Selector   %d",i];
        [self.array addObject:str];
    }
    //    self.array=@[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.array count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSInteger row=indexPath.row;
    cell.textLabel.text=[self.array objectAtIndex:row];
    if ([self.selectedArray indexOfObject:indexPath]==NSNotFound) {
        cell.accessoryType=UITableViewCellAccessoryNone;
    } else {
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    NSInteger row=indexPath.row;
    if ([self.selectedArray indexOfObject:indexPath]==NSNotFound) {
        UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
        [self.selectedArray addObject:indexPath];
    } else {
        UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType=UITableViewCellAccessoryNone;
        [self.selectedArray removeObject:indexPath];
    }
}

-(IBAction)cancel:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)deon:(id)sender{
    NSMutableArray *s=[[NSMutableArray alloc] init];
    for (NSIndexPath *index in self.selectedArray) {
        NSInteger row=index.row;
        [s addObject:[self.array objectAtIndex:row]];
    }
    [self.delegate returnSelected:s];
    [self dismissViewControllerAnimated:YES completion:nil];
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
