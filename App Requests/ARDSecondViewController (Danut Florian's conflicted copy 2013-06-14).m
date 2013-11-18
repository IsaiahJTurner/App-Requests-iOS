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

@implementation ARDSecondViewController 
@synthesize welcomeLabel;
@synthesize charCount;
@synthesize charRemaining;
@synthesize titleField;
@synthesize descriptionField;
@synthesize licenseField;
@synthesize titleString;
@synthesize licenseString;
@synthesize descriptionString;
@synthesize loginLabel;
@synthesize usernameString;

-(void)viewDidLoad
{
    [super viewDidLoad];
   //Load up our NSArray object

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidLoad];
    if ([PFUser currentUser]) {
        [welcomeLabel setText:[NSString stringWithFormat:@"Welcome %@!", [[PFUser currentUser] username]]];
    } else {
        [welcomeLabel setText:@"Not logged in"];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    usernameString = [defaults objectForKey:@"username"];
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(defaultsChanged:) name:NSUserDefaultsDidChangeNotification object:nil];    //THIS CODE HAS ANOTHER DECLARATION IN VOID METHOD
    if (usernameString==nil) {
        loginLabel.text = @"You must login or create an account to submit ideas.";
    } else {
    loginLabel.text = [@"Curently logged in as, " stringByAppendingString:usernameString];
    }
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
    // get paths from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"stepone.plist"];
    
    
    // set the variables to the values in the text fields
    self.titleString = titleField.text;
    self.descriptionString = descriptionField.text;
    self.licenseString = licenseField.text;
    // create dictionary with values in UITextFields
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: titleString, descriptionString, licenseString, nil] forKeys:[NSArray arrayWithObjects: @"title", @"description", @"license", nil]];
    
    NSString *error = nil;
    // create NSData from dictionary
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    
    // check is plistData exists
    if(plistData)
    {
        [plistData writeToFile:plistPath atomically:YES];
    }
    else
    {
        NSLog(@"Error in saveData: %@", error);
        [error release];
    }
}
- (NSMutableDictionary*)dictionaryFromPlist {
    NSString *filePath = @"myPlist.plist";
    NSMutableDictionary* propertyListValues = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    return [propertyListValues autorelease];
}

- (BOOL)writeDictionaryToPlist:(NSDictionary*)plistDict{
    NSString *filePath = @"myPlist.plist";
    BOOL result = [plistDict writeToFile:filePath atomically:YES];
    return result;
}
#pragma mark - PFLogInViewControllerDelegate

// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    // Check if both fields are completed
    if (username && password && username.length && password.length) {
        return YES; // Begin login process
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Missing Information" message:@"Make sure you fill out all of the information!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil] show];
    return NO; // Interrupt login process
}

// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - PFSignUpViewControllerDelegate

// Sent to the delegate to determine whether the sign up request should be submitted to the server.
- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
    BOOL informationComplete = YES;
    
    // loop through all of the submitted data
    for (id key in info) {
        NSString *field = [info objectForKey:key];
        if (!field || !field.length) { // check completion
            informationComplete = NO;
            break;
        }
    }
    
    // Display an alert if a field wasn't completed
    if (!informationComplete) {
        [[[UIAlertView alloc] initWithTitle:@"Missing Information" message:@"Make sure you fill out all of the information!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil] show];
    }
    
    return informationComplete;
}

// Sent to the delegate when a PFUser is signed up.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the sign up attempt fails.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
    NSLog(@"Failed to sign up...");
}

// Sent to the delegate when the sign up screen is dismissed.
- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    NSLog(@"User dismissed the signUpViewController");
}
//This is run if the loginabel text changed ie. user created account
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




- (IBAction)dismissModal:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)dealloc {
    [loginLabel release];
    [super dealloc];
}
@end
