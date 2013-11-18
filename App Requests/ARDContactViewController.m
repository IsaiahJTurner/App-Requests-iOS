//
//  ARDContactViewController.m
//  App Requests
//
//  Created by App Requests on 5/10/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDContactViewController.h"
#import "ARDPremissionsViewController.h"
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

//From VC step ONE
@synthesize titleString;
@synthesize descriptionString;
@synthesize licenseString;

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
    self.navigationItem.title = @"Step 2";
    self.navigationItem.backBarButtonItem.title = @"Step 1";
   // UIBarButtonItem *accountTools = [[UIBarButtonItem alloc] initWithTitle:@"Account Tools" style:UIBarButtonItemStylePlain target:self action:@selector(accountTools:)];
   // self.navigationItem.rightBarButtonItem = accountTools;
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
    //present the next VC
    ARDPremissionsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"stepThree"];
    vc.titleString = titleString;
    vc.descriptionString = descriptionString;
    vc.licenseString = licenseString;
    vc.emailString = emailField.text;
    vc.twitterString = twitterField.text;
    vc.phoneString = phoneField.text;
    vc.iMessageString = iMessageField.text;
    vc.appnetString = appnetField.text;
    vc.skypeString = skypeField.text;
    vc.otherNameString = otherNameField.text;
    vc.otherHandleString = otherHandleField.text;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)dismissModal:(id)sender {
   [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)accountTools:(id)sender {
    [self performSegueWithIdentifier:@"stepTwoAccount" sender:self];
    
}

- (void)dealloc {
    [emailField release];
    [twitterField release];
    [phoneField release];
    [iMessageField release];
    [appnetField release];
    [skypeField release];
    [super dealloc];
}
@end
