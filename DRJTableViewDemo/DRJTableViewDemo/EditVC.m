//
//  EditVC.m
//  TableViewDemo
//
//  Created by Afmobi on 16/7/13.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "EditVC.h"

@interface EditVC ()

@property (nonatomic,strong) IBOutlet UITableView *table;
@property (nonatomic,strong) IBOutlet UIButton *addBn;
@property (nonatomic,strong) IBOutlet UIButton *deleteBn;

@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic) NSUInteger action;

@end

@implementation EditVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.array=[[NSMutableArray alloc] initWithObjects:@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天", nil];
    self.action=0;
    self.table.delegate=self;
    self.table.dataSource=self;
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TableSampleIdentifier];
    }
    //    for (int i=0; i<array.count; i++) {
    cell.textLabel.text=[self.array objectAtIndex:indexPath.row];
    
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

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.action==0?UITableViewCellEditingStyleDelete:UITableViewCellEditingStyleInsert;
}

-(NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Go on";
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==6){
        return NO;
    }else{
        return YES;
    }
}
//-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
//    return YES;
//}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    NSInteger sourceIndex=sourceIndexPath.row;
    NSInteger destinationIndex=destinationIndexPath.row;
    id obj=[self.array objectAtIndex:sourceIndex];
    [self.array removeObjectAtIndex:sourceIndex];
    [self.array insertObject:obj atIndex:destinationIndex];
    
}
/**
 编辑完时激发该方法
 */
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        NSInteger rowNO=indexPath.row;
        [self.array removeObjectAtIndex:rowNO];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }else if (editingStyle==UITableViewCellEditingStyleInsert){
        [self.array insertObject:[self.array objectAtIndex:indexPath.row] atIndex:indexPath.row+1];
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(IBAction)addData:(id)sender{
    //    NSString *str=[[NSString alloc] stringByAppendingFormat:[sender currentTitle]];
    //    NSLog(str);
    //    if([[sender titleForState:UIControlStateNormal] isEqualToString:@"Delete"]){
    //        self.action=0;
    //    }else{
    self.action=1;
    //    }
    [self.table setEditing:!self.table.editing animated:YES];
    if (self.table.editing) {
        [self.addBn setTitle:@"Commint" forState:UIControlStateNormal];
        [self.deleteBn setTitle:@"Commint" forState:UIControlStateNormal];
    }else{
        [self.addBn setTitle:@"Add" forState:UIControlStateNormal];
        [self.deleteBn setTitle:@"Delete" forState:UIControlStateNormal];
    }
}
-(IBAction)deleteData:(id)sender{
    self.action=0;
    [self.table setEditing:!self.table.editing animated:YES];
    if (self.table.editing) {
        [self.deleteBn setTitle:@"Commint" forState:UIControlStateNormal];
        [self.addBn setTitle:@"Commint" forState:UIControlStateNormal];
        
    }else{
        [self.addBn setTitle:@"Add" forState:UIControlStateNormal];
        [self.deleteBn setTitle:@"Delete" forState:UIControlStateNormal];
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
