//
//  ARDContactViewController.m
//  App Requests
//
//  Created by App Requests on 5/10/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDContactViewController.h"

@interface ARDContactViewController ()

@end

@implementation ARDContactViewController

@synthesize emailField;
@synthesize twitterField;
@synthesize phoneField;
@synthesize iMessageField;
@synthesize appnetField;
@synthesize skypeField;
@synthesize otherNameField;
@synthesize otherHandleField;
@synthesize emailString;
@synthesize twitterString;
@synthesize phoneString;
@synthesize iMessageString;
@synthesize appnetString;
@synthesize skypeString;
@synthesize otherNameString;
@synthesize otherHandleString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *) textField {
    
    [[self.view viewWithTag:textField.tag+1] becomeFirstResponder];
    return YES;
    
}

- (IBAction) saveData {
    // get paths from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"steptwo.plist"];
    
    // set the variables to the values in the text fields
    self.emailString = emailField.text;
    self.twitterString = twitterField.text;
    self.phoneString = phoneField.text;
    self.iMessageString = iMessageField.text;
    self.appnetString = appnetField.text;
    self.skypeString = skypeField.text;
    self.otherNameString = otherNameField.text;
    self.otherHandleString = otherHandleField.text;

    // create dictionary with values in UITextFields
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: emailString, twitterString, phoneString, iMessageString, appnetString, skypeString, otherNameString, otherHandleString, nil] forKeys:[NSArray arrayWithObjects: @"email", @"twitter", @"phone", @"imessage", @"appnet", @"skype", @"othername", @"otherhandle", nil]];
    
    NSString *error = nil;
    // create NSData from dictionary
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    
    // check is plistData exists
    if(plistData)
    {
        // write plistData to our Data.plist file
        [plistData writeToFile:plistPath atomically:YES];
    }
    else
    {
        NSLog(@"Error in saveData: %@", error);
        [error release];
    }
}

- (IBAction)dismissModal:(id)sender {
   [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    [emailField release];
    [twitterField release];
    [phoneField release];
    [iMessageField release];
    [appnetField release];
    [skypeField release];
    [otherNameString release];
    [otherHandleString release];
    [super dealloc];
}
@end
