//
//  ARDPremissionsViewController.m
//  App Requests
//
//  Created by App Requests on 6/12/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDPremissionsViewController.h"
#import "ARDRatingViewController.h"
@interface ARDPremissionsViewController ()

@end

@implementation ARDPremissionsViewController
@synthesize contentSwitch;
@synthesize ratingSwitch;
@synthesize contactSwitch;
@synthesize premissions;
@synthesize contentSwitchString;
@synthesize ratingSwitchString;
@synthesize contactSwitchString;

//From VC stepOne
@synthesize titleString;
@synthesize licenseString;
@synthesize descriptionString;

//From VC stepTwo
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
    self.navigationItem.title = @"Step 3";
   // UIBarButtonItem *accountTools = [[UIBarButtonItem alloc] initWithTitle:@"Account Tools" style:UIBarButtonItemStylePlain target:self action:@selector(accountTools:)];
   // self.navigationItem.rightBarButtonItem = accountTools;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveSwitches:(id)sender {
    if ([contentSwitch isOn]) {
        contentSwitchString = @"content";
    } else {
        contentSwitchString = @"";
    }
    
    if ([ratingSwitch isOn]) {
        ratingSwitchString = @"rating";
    } else {
        ratingSwitchString = @"";
    }
    
    if ([contactSwitch isOn]) {
        contactSwitchString = @"contact";
    } else {
        contactSwitchString = @"";
    }
   premissions = [NSString stringWithFormat:@"%@%@%@", contentSwitchString, ratingSwitchString, contactSwitchString];
    //presnet the next VC
    ARDRatingViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"stepFour"];
    vc.titleString = titleString;
    vc.descriptionString = descriptionString;
    vc.licenseString = licenseString;
    vc.emailString = emailString;
    vc.twitterString = twitterString;
    vc.phoneString = phoneString;
    vc.iMessageString = iMessageString;
    vc.appnetString = appnetString;
    vc.skypeString = skypeString;
    vc.otherNameString = otherNameString;
    vc.otherHandleString = otherHandleString;
    vc.premissions = premissions;
    [self.navigationController pushViewController:vc animated:YES];

    NSLog(@"%@", premissions);
}

-(IBAction)accountTools:(id)sender {
    [self performSegueWithIdentifier:@"stepThreeAccount" sender:self];
    
}

- (IBAction)dismissModal:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
