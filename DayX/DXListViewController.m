//
//  DXListViewController.m
//  DayX
//
//  Created by Brandon Beecroft on 9/19/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DXListViewController.h"
#import "DXListViewTableDataSource.h"
#import "DXViewController.h"
#import "EntryController.h"

@interface DXListViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DXListViewTableDataSource *dataSource;

@end

@implementation DXListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Day X Entries";

    // add Navigation Item
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewAppIdea)];
    [self.navigationItem setRightBarButtonItem:addButton animated:YES];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];

    self.dataSource = [DXListViewTableDataSource new];
    [self.dataSource registerTableView:self.tableView];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // find the object from the indexPath value in NSUserDefaults
    // push a new view controller with that dictionary.

    DXViewController *detailViewController = [DXViewController new];
    DXEntry *entry = [EntryController sharedInstance].entries[indexPath.row];
    //NSLog(@"%@",entry.title);
    detailViewController.appEntry = entry;
    //[detailViewController configureWithObject:entry];
    detailViewController.isNewEntry = NO;

    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:detailViewController animated:YES];

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

-(void)addNewAppIdea {
    DXViewController *addAppDetail = [DXViewController new];
    addAppDetail.isNewEntry = YES;
    [self.navigationController pushViewController:addAppDetail animated:YES];
}




@end
