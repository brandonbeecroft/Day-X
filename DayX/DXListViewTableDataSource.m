//
//  DXListViewTableDataSource.m
//  DayX
//
//  Created by Brandon Beecroft on 9/19/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DXListViewTableDataSource.h"

@implementation DXListViewTableDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}


@end
