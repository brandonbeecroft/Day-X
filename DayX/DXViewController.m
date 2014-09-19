//
//  DXViewController.m
//  DayX
//
//  Created by Brandon Beecroft on 9/16/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DXViewController.h"

static NSString * const appKey = @"appKey";
static NSString * const appTitleKey = @"appTitleKey";
static NSString * const appIdeaKey = @"appIdeaKey";

@interface DXViewController ()

@property (nonatomic, weak) IBOutlet UITextField *appTitle;
@property (nonatomic, weak) IBOutlet UITextView *appIdeaTextView;
@property (nonatomic, weak) IBOutlet UIButton *clearButton;

@end

@implementation DXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = @"Day X";
    self.appTitle.delegate = self;
    self.appIdeaTextView.delegate = self;

    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveEntry)];
    [self.navigationItem setRightBarButtonItem:saveButton];
    UIBarButtonItem *clearButton = [[UIBarButtonItem alloc] initWithTitle:@"Clear" style:UIBarButtonItemStylePlain target:self action:@selector(clear)];
    [self.navigationItem setLeftBarButtonItem:clearButton];

    NSDictionary *app = [[NSUserDefaults standardUserDefaults] objectForKey:appKey];
    [self updateAppDictionary:app];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)clear {
    // set an alert view to make sure they want to clear
    self.appTitle.text = @"";
    self.appIdeaTextView.text = @"";
}

-(void)saveEntry {
    NSLog(@"Entry Saved method");
    [self.appIdeaTextView resignFirstResponder];

    NSMutableDictionary *app = [NSMutableDictionary new];
    if (self.appTitle.text) {
        [app setObject:self.appTitle.text forKey:appTitleKey];
    }
    if (self.appIdeaTextView.text) {
        [app setObject:self.appIdeaTextView.text forKey:appIdeaKey];
    }

    [[NSUserDefaults standardUserDefaults] setObject:app forKey:appKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)updateAppDictionary:(NSDictionary *)dictionary {
    NSString *appTitle = dictionary[appTitleKey];
    NSString *appText = dictionary[appIdeaKey];

    if (appTitle && appText) {
        self.appTitle.text = appTitle;
        self.appIdeaTextView.text = appText;
    }

}

@end
