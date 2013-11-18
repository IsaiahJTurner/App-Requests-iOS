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
    
}

- (IBAction)removeAds:(id)sender {
    
}

- (IBAction)restorePurchases:(id)sender {
}


@end
