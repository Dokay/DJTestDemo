//
//  DJTestCell.m
//  DJTestTableViewReloadData
//
//  Created by Dokay on 2017/11/3.
//Copyright © 2017年 dj226. All rights reserved.
//

#import "DJTestCell.h"

@implementation DJTestCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    printf("DJTestCell->initWithStyle \n");
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
