//
//  DXViewController.m
//  DayX
//
//  Created by Brandon Beecroft on 9/16/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DXViewController.h"

@interface DXViewController ()

@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UITextView *textView;

@end

@implementation DXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = @"Day X";
    self.textField.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
