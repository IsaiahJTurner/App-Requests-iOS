//
//  ARDContactLinksViewController.m
//  App Requests
//
//  Created by App Requests on 8/17/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDContactLinksViewController.h"
#import "Apsalar.h"

@interface ARDContactLinksViewController ()

@end

@implementation ARDContactLinksViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)twitterAppRequestsApp:(id)sender {
    [Apsalar event:@"Opened Twitter AppRequestsApp"];

[[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://twitter.com/AppRequestsApp/"]];
}

- (IBAction)twitterIsaiahJTurner:(id)sender {
    [Apsalar event:@"Opened Twitter IsaiahJTurner"];

    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://twitter.com/IsaiahJTurner/"]];
}

- (IBAction)twitterTurboeCreations:(id)sender {
    [Apsalar event:@"Opened Twitter TurboeCreations"];

    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://twitter.com/TurboeCreations/"]];
}
- (IBAction)twitterTheJarbinator:(id)sender {
    [Apsalar event:@"Opened Twitter TheJarbinator"];

    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://twitter.com/TheJarbinator/"]];
}
- (IBAction)ourWebsite:(id)sender {
    [Apsalar event:@"Opened http://turboecreations.com"];

    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://turboecreations.com/"]];
}
- (IBAction)facebookTurboeCreations:(id)sender {
    [Apsalar event:@"Opened Facebook TurboeCreations"];

    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://facebook.com/TurboeCreations/"]];
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

@end
