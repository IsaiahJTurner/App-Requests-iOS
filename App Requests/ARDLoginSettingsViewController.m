//
//  ARDLoginSettingsViewController.m
//  App Requests
//
//  Created by App Requests on 6/9/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDLoginSettingsViewController.h"
#import "SVStatusHUD.h"
#import "ARDIdeaListViewController.h"

@interface ARDLoginSettingsViewController ()

@end

@implementation ARDLoginSettingsViewController
@synthesize usernameField;
@synthesize passwordField;
@synthesize valid;

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
    self.navigationItem.leftBarButtonItem =  [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self
                                                                             action:@selector(cancelButton:)];
    self.navigationItem.title = @"Reviewer Login";
    
}
- (void)viewDidAppear:(BOOL)animated {
    [self.usernameField becomeFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButton:(id)sender {
    
    NSString *post =[NSString stringWithFormat:@"secret=IfYouAreReadingThisThenSendMeAnEmailAndTellMeYouReadThis&username=%@&password=%@",usernameField.text, passwordField.text];
    
    NSString *hostStr = [NSString stringWithFormat:@"http://turboe.co/AppRequests/in-app/reviewers/%@/get-userid.php?", usernameField.text];
    hostStr = [hostStr stringByAppendingString:post];
    NSData *dataURL =  [NSData dataWithContentsOfURL: [ NSURL URLWithString: hostStr ]];
    NSString *serverOutput = [[NSString alloc] initWithData:dataURL encoding: NSASCIIStringEncoding];
    NSLog(@"%@", serverOutput);
    
    
    
    
    valid = FALSE;
    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:serverOutput];
    valid = [alphaNums isSupersetOfSet:inStringSet];
    
    
    
    
    if([serverOutput isEqualToString:@"not equal"]){
        
        
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Password Incorrect" message:@"Please check your password and try again."
                                                              delegate:self cancelButtonTitle:@"Oh, no!" otherButtonTitles:nil, nil];
        [alertsuccess show];
        passwordField.secureTextEntry = NO;
        [alertsuccess release];
        passwordField.text = @"";
    } else if (!valid) {
        //This will run if the server output in not equal to "not equal" OR if it is not an integer (0-9)
        UIAlertView *alertfail = [[UIAlertView alloc] initWithTitle:@"Login Error" message:@"This error most often means that your username is not yet registered."
                                                           delegate:self cancelButtonTitle:@"Serriously..." otherButtonTitles:nil, nil];
        [alertfail show];
        [alertfail release];
    } else {
        //This code runs if the server outputs an integer, it does not neccessarily mean that authentication worked
        NSLog(@"logged in");
        NSString *hostStr = [NSString stringWithFormat:@"http://turboe.co/AppRequests/in-app/reviewers/%@/get-unreviewed.php", usernameField.text];
        NSURL *finalURL = [NSURL URLWithString:hostStr];
        
        NSString *returnResults = [[NSString alloc]initWithContentsOfURL:finalURL encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"%@",returnResults);
        NSData *jsData = [returnResults dataUsingEncoding:NSUTF32BigEndianStringEncoding];
        
        NSDictionary *dictResults = [NSJSONSerialization JSONObjectWithData:jsData options:NSJSONReadingMutableContainers error:NULL];
        
        NSLog(@"%@", hostStr);
        NSArray *arrayResults = [dictResults objectForKey:@"submissions"];

        NSLog(@"%@", arrayResults);
        
        //Now we will switch to the results view controller
        ARDIdeaListViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"reviewingVC"];
        vc.ideaList = arrayResults;
        UINavigationController *vcNAV = [[UINavigationController alloc] initWithRootViewController:vc];

        [self presentViewController:vcNAV animated:YES completion:nil];
        [SVStatusHUD showWithImage:[UIImage imageNamed:@"connected.png"] status:@"Logged In"];
        
        
    }
}
-(IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
