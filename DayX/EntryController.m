//
//  EntryControler.m
//  Entries
//
//  Created by Joshua Howland on 9/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "EntryController.h"
#import "DXEntry.h"

static NSString * const entryListKey = @"entryList";

@interface EntryController ()

@property (nonatomic, strong) NSArray *entries;

@end

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
        
        [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}

- (void)addEntry:(DXEntry *)entry {

    if (!entry) {
        return;
    }
    
    NSMutableArray *mutableEntries = [[NSMutableArray alloc] initWithArray:self.entries];
    [mutableEntries addObject:entry];
    
    self.entries = mutableEntries;
    [self synchronize];
}

- (void)removeEntry:(NSDictionary *)entry {

    if (!entry) {
        return;
    }
    
    NSMutableArray *mutableEntries = self.entries.mutableCopy;
    [mutableEntries removeObject:entry];
    
    self.entries = mutableEntries;
    [self synchronize];

}

- (void)replaceEntry:(DXEntry *)oldEntry withEntry:(DXEntry *)newEntry {

    if (!oldEntry || !newEntry) {
        return;
    }
    
    NSMutableArray *mutableEntries = self.entries.mutableCopy;
    
    if ([mutableEntries containsObject:oldEntry]) {
        NSInteger index = [mutableEntries indexOfObject:oldEntry];
        [mutableEntries replaceObjectAtIndex:index withObject:newEntry];
    }
    
    self.entries = mutableEntries;
    [self synchronize];  
}

//- (void)loadFromDefaults {
//    
//    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:entryListKey];
//    self.entries = entryDictionaries;
//    
//}

- (void)loadFromDefaults {

    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:entryListKey];

    NSMutableArray *entries = [NSMutableArray new];
    for (int x = 0; x < entryDictionaries.count; x++) {
        NSDictionary *dictionary = entryDictionaries[x];
        DXEntry *entry = [[DXEntry alloc] initWithDictionary:dictionary];
        [entries addObject:entry];
    }

    if (entries != nil) {
        self.entries = entries;
    }
    
}

- (void)synchronize {

    NSMutableArray *entryDictionaries = [NSMutableArray new];
    for (DXEntry *entry in self.entries) {
        [entryDictionaries addObject:[entry entryDictionary]];
    }

    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:entryListKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

@end
