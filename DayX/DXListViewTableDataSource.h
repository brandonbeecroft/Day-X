//
//  DXListViewTableDataSource.h
//  DayX
//
//  Created by Brandon Beecroft on 9/19/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DXListViewTableDataSource : NSObject <UITableViewDataSource>

-(void)registerTableView:(UITableView *)tableView;

@end
