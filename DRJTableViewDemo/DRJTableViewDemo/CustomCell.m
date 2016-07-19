//
//  CustomCellTableViewCell.m
//  DRJTableViewDemo
//
//  Created by Afmobi on 16/7/19.
//  Copyright © 2016年 Afmobi. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(35, 0, 220, 44)];
        self.titleLabel.textAlignment=NSTextAlignmentLeft;//左对齐
        self.titleLabel.font=[UIFont systemFontOfSize:18];
        self.titleLabel.textColor=[UIColor grayColor];
        [self.contentView addSubview:self.titleLabel];
        
        self.contentLabel=[[UILabel alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width-35, 0, 120, 44)];
        self.contentLabel.textAlignment=NSTextAlignmentRight;//右对齐
//        self.contentLabel.textAlignment=NSTextAlignmentLeft;//左对齐
        self.contentLabel.font=[UIFont systemFontOfSize:16];
        self.contentLabel.textColor=[UIColor redColor];
        [self.contentView addSubview:self.contentLabel];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
