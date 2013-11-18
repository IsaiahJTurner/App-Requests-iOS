//
//  ARDRatingViewController.m
//  App Requests
//
//  Created by App Requests on 5/10/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDRatingViewController.h"
#import "ARDReviewViewController.h"

@interface ARDRatingViewController ()

@end

@implementation ARDRatingViewController
@synthesize catagoryPicker;
@synthesize catagorys;
@synthesize catagoryString;
@synthesize ageRestriction;
@synthesize ageRestrictionString;

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

//From VC stepThree
@synthesize premissions;


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
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    self.navigationItem.title = @"Step 4";
        catagoryString = @"";
        ageRestrictionString = @"17+";
    [super viewDidLoad];
        catagorys = [[NSArray alloc] initWithObjects:@"",@"Games",@"Education",@"Newsstand",@"Books",@"Buisness",@"Catalogs",@"Entertainment",@"Finance",@"Food & Drink",@"Health & Fitness",@"Lifestyle",@"Medical",@"Music",@"Navigation",@"News",@"Photo & Video",@"Productivity",@"Reverence",@"Social Networking",@"Sports",@"Travel",@"Utilitys",@"Weather",@"Other", nil];
	// Do any additional setup after loading the view.
   // UIBarButtonItem *accountTools = [[UIBarButtonItem alloc] initWithTitle:@"Account Tools" style:UIBarButtonItemStylePlain target:self action:@selector(accountTools:)];
    //self.navigationItem.rightBarButtonItem = accountTools;
    NSURL *url = [NSURL URLWithString:@"http://turboecreations.com/"];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];        
        [webView loadRequest:requestObj];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissModal:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Segmented Control Methods
- (IBAction)changeRestriction{
	if(ageRestriction.selectedSegmentIndex == 0){
		ageRestrictionString = @"4+";
	}
	if(ageRestriction.selectedSegmentIndex == 1){
        ageRestrictionString = @"9+";

	}
    if(ageRestriction.selectedSegmentIndex == 2){
        ageRestrictionString = @"12+";

	}
    if(ageRestriction.selectedSegmentIndex == 3){
        ageRestrictionString = @"17+";

	}
    NSLog(@"%@",ageRestrictionString);
}

#pragma mark - UIPickerView Methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return catagorys.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [catagorys objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    catagoryString = [catagorys objectAtIndex:row];
    
    NSLog(@"%@", catagoryString);
}

- (IBAction)saveData:(id)sender {
    if ([catagoryString isEqual:@""]) {
        
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please select a category above."
                                                              delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertsuccess show];
        [alertsuccess release];

    } else {
        //present the next VC
    ARDReviewViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"reviewRequest"];
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
        vc.catagoryString = catagoryString;
        vc.ageRestrictionString = ageRestrictionString;
    [self.navigationController pushViewController:vc animated:YES];
    }
}

-(IBAction)accountTools:(id)sender {
    [self performSegueWithIdentifier:@"stepFourAccount" sender:self];
    
}


- (void)dealloc {
    [webView release];
    [super dealloc];
}
@end
