//
//  DXViewController.h
//  DayX
//
//  Created by Brandon Beecroft on 9/16/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DXEntry.h"

@interface DXViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) IBOutlet UITextField *appTitle;
@property (nonatomic, weak) IBOutlet UITextView *appIdeaTextView;
@property (nonatomic, weak) IBOutlet UIButton *clearButton;

@property (nonatomic, strong) DXEntry *appEntry;
@property (nonatomic, assign) BOOL isNewEntry;

//-(void)configureWithObject:(DXEntry *)entry;

@end
