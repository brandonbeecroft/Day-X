//
//  DXViewController.m
//  DayX
//
//  Created by Brandon Beecroft on 9/16/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DXViewController.h"
#import "DXListViewController.h"
#import "DXEntry.h"
#import "EntryController.h"

static NSString * const appKey = @"appKey";
static NSString * const appTitleKey = @"appTitleKey";
static NSString * const appIdeaKey = @"appIdeaKey";

@interface DXViewController ()

@end

@implementation DXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = @"Entry";
    self.appTitle.delegate = self;
    self.appIdeaTextView.delegate = self;

    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveEntry)];
    [self.navigationItem setRightBarButtonItem:saveButton];
    UIBarButtonItem *clearButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    [self.navigationItem setLeftBarButtonItem:clearButton];

    if (_isNewEntry == YES) {
        NSLog(@"New Entry");
    }

    if (_isNewEntry == NO) {
        NSLog(@"This is not a new entry");
        self.appTitle.text = _appEntry.title;
        self.appIdeaTextView.text = _appEntry.note;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)cancel {
    // set an alert view to make sure they want to clear
    [self.navigationController popToRootViewControllerAnimated:YES];

    self.appTitle.text = @"";
    self.appIdeaTextView.text = @"";
}

-(void)saveEntry {
    [self.appIdeaTextView resignFirstResponder];

    DXEntry *entry = [DXEntry new];
    entry.title = self.appTitle.text;
    entry.note = self.appIdeaTextView.text;
    entry.timeStamp = [NSDate date];

    if (_isNewEntry) {
        [[EntryController sharedInstance] addEntry:entry];
    } else {
        NSLog(@"this is not a new entry!");
        // use the replace method
        [[EntryController sharedInstance] replaceEntry:_appEntry withEntry:entry];
}
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//-(void)configureWithObject:(DXEntry *)entry {
//    self.appTitle.text = entry.title;
//    self.appIdeaTextView.text = entry.note;
//}


@end
