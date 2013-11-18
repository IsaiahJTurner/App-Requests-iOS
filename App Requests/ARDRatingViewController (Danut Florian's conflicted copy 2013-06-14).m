//
//  ARDRatingViewController.m
//  App Requests
//
//  Created by App Requests on 5/10/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDRatingViewController.h"

@interface ARDRatingViewController ()

@end

@implementation ARDRatingViewController
@synthesize catagoryPicker;
@synthesize catagorys;
@synthesize catagoryString;
@synthesize ageRestriction;
@synthesize ageRestrictionString;

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
        catagoryString = @"Games";
        ageRestrictionString = @"17+";
    // get paths from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"stepthree.plist"];
    
    // set the variables to the values in the text fields
    //self.otherNameString = otherNameField.text;
    //self.otherHandleString = otherHandleField.text;
    
    // create dictionary with values in UITextFields
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: catagoryString, ageRestrictionString, nil] forKeys:[NSArray arrayWithObjects: @"catagory", @"agerestriction", nil]];
    
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
    

    [super viewDidLoad];
        catagorys = [[NSArray alloc] initWithObjects:@"Games",@"Education",@"Newsstand",@"Books",@"Buisness",@"Catalogs",@"Entertainment",@"Finance",@"Food & Drink",@"Health & Fitness",@"Lifestyle",@"Medical",@"Music",@"Navigation",@"News",@"Photo & Video",@"Productivity",@"Reverence",@"Social Networking",@"Sports",@"Travel",@"Utilitys",@"Weather",@"Other", nil];
	// Do any additional setup after loading the view.
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
    // get paths from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"stepthree.plist"];
    
    // set the variables to the values in the text fields
    //self.otherNameString = otherNameField.text;
    //self.otherHandleString = otherHandleField.text;
    
    // create dictionary with values in UITextFields
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: catagoryString, ageRestrictionString, nil] forKeys:[NSArray arrayWithObjects: @"catagory", @"agerestriction", nil]];
    
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
    // get paths from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"stepthree.plist"];
    
    // set the variables to the values in the text fields
    //self.otherNameString = otherNameField.text;
    //self.otherHandleString = otherHandleField.text;
    
    // create dictionary with values in UITextFields
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: catagoryString, ageRestrictionString, nil] forKeys:[NSArray arrayWithObjects: @"catagory", @"agerestriction", nil]];
    
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

@end
