//
//  DXEntry.m
//  DayX
//
//  Created by Brandon Beecroft on 9/20/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DXEntry.h"

static NSString * const titleKey = @"titleKey";
static NSString * const noteKey = @"noteKey";
static NSString * const dateKey = @"dateKey";


@implementation DXEntry

-(NSDictionary *)entryDictionary {

    // this is a conversion to a dictionary
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    if (self.title != nil) {
        dictionary[@"title"] = self.title;
    }

    if (self.note != nil) {
        dictionary[@"note"] = self.note;
    }

    if (self.timeStamp != nil) {
        //dictionary[@"timestamp"] = self.timeStamp;
        [dictionary setValue:self.timeStamp forKey:@"dateKey"];
    }

    return dictionary;

}

-(id)initWithDictionary:(NSDictionary *)dictionary {
    // this method converts from a dictionary
    // always have this check
    self = [super init];
    if (self) {
        self.title = dictionary[@"title"];
        self.note = dictionary[@"note"];
        self.timeStamp = [dictionary valueForKey:@"dateKey"];
    }
    return self;
}

@end
