//
//  EntryControler.h
//  Entries
//
//  Created by Joshua Howland on 9/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DXEntry.h"

@interface EntryController : NSObject

@property (nonatomic, strong, readonly) NSArray *entries;

+ (EntryController *)sharedInstance;

- (void)addEntry:(DXEntry *)entry;
- (void)removeEntry:(NSDictionary *)entry;
- (void)replaceEntry:(DXEntry *)oldEntry withEntry:(DXEntry *)newEntry;

@end
