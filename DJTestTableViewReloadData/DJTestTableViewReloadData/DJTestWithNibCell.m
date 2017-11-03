//
//  DJTestWithNibCell.m
//  DJTestTableViewReloadData
//
//  Created by Dokay on 2017/11/3.
//Copyright © 2017年 dj226. All rights reserved.
//

#import "DJTestWithNibCell.h"

@implementation DJTestWithNibCell

- (void)awakeFromNib
{
    // Initialization code
    [super awakeFromNib];
    printf("DJTestWithNibCell->awakeFromNib \n");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
