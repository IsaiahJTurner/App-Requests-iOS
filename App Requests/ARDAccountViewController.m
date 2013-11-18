//
//  ARDAccountViewController.m
//  App Requests
//
//  Created by App Requests on 5/4/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDAccountViewController.h"
#import "ARDCreateAccountViewController.h"
#import "KeychainItemWrapper.h"

@interface ARDAccountViewController ()
@end
@implementation ARDAccountViewController
@synthesize userLabel;
@synthesize usernameString;

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(defaultsChanged:) name:NSUserDefaultsDidChangeNotification object:nil];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    usernameString = [defaults objectForKey:@"username"];
    if (usernameString==nil) {
        userLabel.text = @"Not logged in.";
    } else {
        userLabel.text = [@"Welcome " stringByAppendingString:usernameString];
    }
    [super viewDidLoad];
    self.navigationItem.title = @"Account Tools";
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)defaultsChanged:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    usernameString = [defaults objectForKey:@"username"];
    if (usernameString==nil) {
        userLabel.text = @"Not logged in.";
    } else {
        userLabel.text = [@"Welcome, " stringByAppendingString:usernameString];
    }

}

- (IBAction)signOut:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:nil forKey:@"username"];
    [defaults setObject:nil forKey:@"birthstring"];
    [defaults setObject:nil forKey:@"userid"];
    
    //first we save the details to the keychain
    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"logindetails" accessGroup:nil];

    // Store password to keychain
    [keychain setObject:@"" forKey:(id)kSecValueData];
    

}
@end
