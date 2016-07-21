//
//  KvoVC.m
//  DRJStudyDemo
//
//  Created by Afmobi on 16/7/21.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "KvoVC.h"
#import "Pruduct.h"

@interface KvoVC()
@property (weak, nonatomic) IBOutlet UITextField *input;
@property(strong,nonatomic)IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (strong, nonatomic) Pruduct *pruduct;
@end

@implementation KvoVC

-(void)viewDidLoad{
    [super viewDidLoad];
    self.pruduct = [[Pruduct alloc]init];
    self.pruduct.price=0;
    [self.pruduct addObserver:self forKeyPath:@"price" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    NSString *str=[NSString stringWithFormat:@"%d",self.pruduct.price];
    self.priceLabel.text=str;
}

-(IBAction)changePrice:(id)sender{
    NSString *inputText=self.input.text;
    if (inputText!=nil && inputText.length>0) {
        self.pruduct.price=[inputText intValue];
//        [self.pruduct setValue:<#(nullable id)#> forKey:<#(nonnull NSString *)#>];
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSString *str=[NSString stringWithFormat:@"%d",self.pruduct.price];
//    [self.priceLabel setValue:str forKey:self.priceLabel.text];
    self.priceLabel.text=str;
}

- (void)dealloc
{
//    [super dealloc];
    [self.pruduct removeObserver:self forKeyPath:@"price"];
}
@end
