//
//  ARDSecondViewController.m
//  App Requests
//
//  Created by App Requests on 4/7/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//
#import "UIKit/UIKit.h"
#import "ARDSecondViewController.h"
#import "QuartzCore/QuartzCore.h"
#import "ARDContactViewController.h"


@implementation ARDSecondViewController 
@synthesize welcomeLabel;
@synthesize charCount;
@synthesize charRemaining;
@synthesize titleField;
@synthesize descriptionField;
@synthesize licenseField;
@synthesize loginLabel;
@synthesize usernameString;

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Share YOUR app idea!";
   // UIBarButtonItem *accountTools = [[UIBarButtonItem alloc] initWithTitle:@"Account Tools" style:UIBarButtonItemStylePlain target:self action:@selector(accountTools:)];
    //self.navigationItem.rightBarButtonItem = accountTools;
    usernameString = @""; //this is to get the KVO to run rite away
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidLoad];
    if ([PFUser currentUser]) {
        [welcomeLabel setText:[NSString stringWithFormat:@"Welcome %@!", [[PFUser currentUser] username]]];
    } else {
        [welcomeLabel setText:@"Not logged in"];
    }
   self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
}

- (void)viewDidAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    usernameString = [defaults objectForKey:@"username"];
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(defaultsChanged:) name:NSUserDefaultsDidChangeNotification object:nil];
}
- (BOOL) textFieldShouldReturn:(UITextField *) textField {
    
    [[self.view viewWithTag:textField.tag+1] becomeFirstResponder];
    return YES;
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    charRemaining = [textField.text length];
    NSString *charLabel = [NSString stringWithFormat:@"%d/50", charRemaining];
    charCount.text = charLabel;
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return (newLength > 50) ? NO : YES;
    if ([textField.text length]==-1){
        charLabel = [NSString stringWithFormat:@"50/50"];

    }
    if ([textField.text isEqual:@"\b"]){
        charLabel = [NSString stringWithFormat:@"0/50"];
        
    }
    return YES;

}
- (IBAction)defaultsChanged:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    usernameString = [defaults objectForKey:@"username"];
    if (usernameString==nil) {
        loginLabel.text = @"You must login or create an account to submit ideas.";
    } else {
        loginLabel.text = [@"Curently logged in as, " stringByAppendingString:usernameString];
    }
}
- (IBAction) saveData {
    if ([titleField.text isEqualToString:@""]) {
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Woah there" message:@"Slow down! You need a title!"
                                                              delegate:self cancelButtonTitle:@"Oh, no!" otherButtonTitles:nil, nil];
        [alertsuccess show];

    } else if ([descriptionField.text isEqualToString:@"I want an app that "]) {
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Woah There!" message:@"Slow down! You need a description!"
                                                              delegate:self cancelButtonTitle:@"Oh, no!" otherButtonTitles:nil, nil];
        [alertsuccess show];

    } else {
    //present the next VC
    ARDContactViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"stepTwo"];
    //pass the current varrables to the next view
    vc.titleString = titleField.text;
    vc.descriptionString = descriptionField.text;
    vc.licenseString = licenseField.text;
    [self.navigationController pushViewController:vc animated:YES];
    }
}

//This is run if the loginabel text changed eg. user created account
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    usernameString = [defaults objectForKey:@"username"];

    //THIS CODE HAS ANOTHER DECLARATION IN VIEWDIDLOAD
    if (usernameString==nil) {
        loginLabel.text = @"You must login or create an account to submit ideas.";
    } else {
        loginLabel.text = usernameString;
    }
}
#pragma mark - Logout button handler

- (IBAction)logOutButtonTapAction:(id)sender {
    [PFUser logOut];
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)accountTools:(id)sender {
    [self performSegueWithIdentifier:@"stepOneAccount" sender:self];
    
}


- (IBAction)dismissModal:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)dealloc {
    [loginLabel release];
    [super dealloc];
}



@end
