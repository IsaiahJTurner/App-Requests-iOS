//
//  ARDReviewViewController.m
//  App Requests
//
//  Created by App Requests on 5/10/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDReviewViewController.h"
#import "KeychainItemWrapper.h"

@interface ARDReviewViewController ()

@end

@implementation ARDReviewViewController
@synthesize licenseText;
@synthesize descriptionText;
@synthesize titleLabel;
@synthesize emailLabel;
@synthesize twitterLabel;
@synthesize phoneLabel;
@synthesize iMessageLabel;
@synthesize appnetLabel;
@synthesize skypeLabel;
@synthesize otherNameLabel;
@synthesize otherHandleLabel;
@synthesize catagoryLabel;
@synthesize ageRestrictionLabel;
@synthesize userID;
@synthesize loginNameLabel;
@synthesize premissionsLabel;
@synthesize almostLabel;
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

//From VC stepFour
@synthesize ageRestrictionString;
@synthesize catagoryString;

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
    self.navigationItem.title = @"Last chance to prieview before submiting";
    [super viewDidLoad];

    UIBarButtonItem *accountTools = [[UIBarButtonItem alloc] initWithTitle:@"Account Tools" style:UIBarButtonItemStylePlain target:self
                                                                    action:@selector(accountTools:)];
    self.navigationItem.rightBarButtonItem = accountTools;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    loginNameLabel.text = [defaults objectForKey:@"username"];

    //NSString *userNameInString = [defaults objectForKey:@"username"];
    userID = [defaults objectForKey:@"userid"];
    // display values
    titleLabel.text = titleString;
    descriptionText.text = descriptionString;
    licenseText.text = licenseString;
    emailLabel.text = emailString;
    twitterLabel.text = twitterString;
    phoneLabel.text = phoneString;
    iMessageLabel.text = iMessageString;
    appnetLabel.text = appnetString;
    skypeLabel.text = skypeString;
    otherNameLabel.text = otherNameString;
    otherHandleLabel.text = otherHandleString;
    catagoryLabel.text = catagoryString;
    ageRestrictionLabel.text = ageRestrictionString;
    
    
    
    //now we convert the premissions varriable to a readable form
    if ([premissions isEqual:@""]) {
        premissionsLabel.text = [premissions stringByReplacingOccurrencesOfString:@"the (INSERT)" withString:@"none"];
    } else {

        
        //These are all of the possible outcomes to the premissions varraible
        if ([premissions isEqualToString:@"content"]) {
            almostLabel = @"content";
        }
        
        if ([premissions isEqualToString:@"rating"]) {
            almostLabel = @"rating";
        }
        
        if ([premissions isEqualToString:@"contact"]) {
            almostLabel = @"contact information";
        }
        
        if ([premissions isEqualToString:@"contentrating"]) {
            almostLabel = @"content and rating";
        }
        
        if ([premissions isEqualToString:@"ratingcontact"]) {
            almostLabel = @"rating and contact information";
        }
        
        if ([premissions isEqualToString:@"contentcontact"]) {
            almostLabel = @"content and contact information";
        }
        
        if ([premissions isEqualToString:@"contentratingcontact"]) {
            almostLabel = @"content, rating, and contact information";
        }

        
        //Finally we asign the label its new values
        premissionsLabel.text = [premissionsLabel.text stringByReplacingOccurrencesOfString:@"(INSERT)" withString:almostLabel];
        
        
    }

	// Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated {
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
    KeychainItemWrapper *keychain =  [[KeychainItemWrapper alloc] initWithIdentifier:@"logindetails" accessGroup:nil];

    NSString *prePost =[NSString stringWithFormat:@"userid=%@&title=%@&description=%@&license=%@&email=%@&twitter=%@&phone=%@&imessage=%@&appnet=%@&skype=%@&othername=%@&otherhandle=%@&catagory=%@&agerestriction=%@&secret=IfYouAreReadingThisThenSendMeAnEmailAndTellMeYouReadThis&email=%@&password=%@", userID,titleLabel.text, descriptionText.text, licenseText.text, emailLabel.text, twitterLabel.text, phoneLabel.text,iMessageLabel.text, appnetLabel.text, skypeLabel.text, otherNameLabel.text, otherHandleLabel.text,catagoryLabel.text, ageRestrictionLabel.text, [keychain objectForKey:(id)kSecAttrAccount], [keychain objectForKey:(id)kSecValueData]];
    NSString *post = [prePost stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *hostStr = @"http://apprequestsapp.com/in-app/submissions/submit.php?";
    hostStr = [hostStr stringByAppendingString:post];
    NSData *dataURL =  [NSData dataWithContentsOfURL: [ NSURL URLWithString: hostStr ]];
    NSLog(@"%@%@", hostStr, post);
    
    NSString *serverOutput = [[NSString alloc] initWithData:dataURL encoding: NSASCIIStringEncoding];
    NSLog(@"%@", serverOutput);
    
    
    
    
    
    
    if([serverOutput isEqualToString:@"submitted"]){
        
        
        UIAlertView *alertsuccessful = [[UIAlertView alloc] initWithTitle:@"Submission Successful" message:@"Please allow 24hr before your idea is browsable in the app."
                                                              delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertsuccessful show];
        //now we go all the way back to step one
        
        [self.navigationController popToRootViewControllerAnimated:YES];

    } else if ([serverOutput isEqualToString:@"authentication failed"]){
        
        
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Please Login" message:@"You can login by tapping account tools in the top right corner of the app."
                                                              delegate:self cancelButtonTitle:@"That's Annoying" otherButtonTitles:nil, nil];
        [alertsuccess show];
        [alertsuccess release];
        
        
    } else {
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Submission Unsuccesful" message:@"Please contact support if this problem presists."
                                                              delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertsuccess show];
        [alertsuccess release];
    }


}



-(IBAction)accountTools:(id)sender {
    [self performSegueWithIdentifier:@"reviewAccount" sender:self];
    
}

- (void)dealloc {
    [alertsuccessful setDelegate:nil]; // this prevents the crash in the event that the alertview is still showing.
    self.alertsuccessful = nil; // release it
    
    [premissionsLabel release];
    [super dealloc];
}
@end
