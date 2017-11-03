//
//  DJTableViewController.m
//  DJComponentTableViewVM
//
//  Created by Dokay on 2017/11/2.
//  Copyright © 2017年 dj226. All rights reserved.
//

#import "DJTableViewController.h"
#import "DJTestWithNibCell.h"
#import "DJTestCell.h"

@interface DJTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DJTableViewController

- (void)onTouchTest{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __block NSTimeInterval begin, end;
        begin = CACurrentMediaTime();
        printf("start....\n");
        dispatch_async(dispatch_get_main_queue(), ^{
            printf("reload....\n");
//            [self.tableView reloadData];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
//            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            dispatch_async(dispatch_get_main_queue(),^{
                printf("end....\n");
                end = CACurrentMediaTime();
                printf(" %8.2f ms\n",((end - begin) * 1000));
            });
        });
    });
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    NSDictionary *views = NSDictionaryOfVariableBindings(_tableView);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:nil views:views]];
    [self.tableView registerClass:[DJTestCell class] forCellReuseIdentifier:@"DJTestCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"DJTestWithNibCell" bundle:nil] forCellReuseIdentifier:@"DJTestWithNibCell"];
    
    UIBarButtonItem *testButton = [[UIBarButtonItem alloc] initWithTitle:@"Test" style:UIBarButtonItemStyleDone target:self action:@selector(onTouchTest)];
    self.navigationItem.rightBarButtonItem = testButton;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DJTestWithNibCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DJTestWithNibCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"Section:%@, row:%@",@(indexPath.section),@(indexPath.row)];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"Section Header:%@",@(section)];
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [UITableView new];
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
