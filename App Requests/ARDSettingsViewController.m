//
//  ARDSettingsViewController.m
//  App Requests
//
//  Created by App Requests on 6/9/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDSettingsViewController.h"

@interface ARDSettingsViewController ()

@end

@implementation ARDSettingsViewController
@synthesize postRemoveField;

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)requestUnRemoval:(id)sender {
    
    NSString *post =[NSString stringWithFormat:@"secret=IfYouAreReadingThisThenSendMeAnEmailAndTellMeYouReadThis&id=%@",postRemoveField.text];
    
    NSString *hostStr = [NSString stringWithFormat:@"http://turboe.co/AppRequests/in-app/submissions/protest.php?"];
    hostStr = [hostStr stringByAppendingString:post];
    NSData *dataURL =  [NSData dataWithContentsOfURL: [ NSURL URLWithString: hostStr ]];
    NSString *serverOutput = [[NSString alloc] initWithData:dataURL encoding: NSASCIIStringEncoding];
    NSLog(@"%@", serverOutput);
    
    if([serverOutput isEqualToString:@"recieved"]){
        
        
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Request Recieved" message:@"We will review you request and give an update within 72 hours."
                                                              delegate:self cancelButtonTitle:@"Thank you!" otherButtonTitles:nil, nil];
        [alertsuccess show];
        [alertsuccess release];
        postRemoveField.text = @"";
    } 
}

- (IBAction)removeAds:(id)sender {
    
}

- (IBAction)restorePurchases:(id)sender {
}


@end
