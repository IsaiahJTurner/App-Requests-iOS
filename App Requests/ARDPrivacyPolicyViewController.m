//
//  ARDPrivacyPolicyViewController.m
//  App Requests
//
//  Created by App Requests on 8/17/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDPrivacyPolicyViewController.h"
#import "Apsalar.h"
@interface ARDPrivacyPolicyViewController ()

@end

@implementation ARDPrivacyPolicyViewController
@synthesize webView;
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
    [Apsalar event:@"open-privacy-policy-view"];

    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSString *urlAddress = @"http://turboe.co/AppRequests/in-app/privacy.php";
	//Create a URL object.
	NSURL *url = [NSURL URLWithString:urlAddress];
	
	//URL Requst Object
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	//Load the request in the UIWebView.
	[webView loadRequest:requestObj];
}
- (IBAction)dismisscontroller:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [webView release];
    [super dealloc];
}
@end
