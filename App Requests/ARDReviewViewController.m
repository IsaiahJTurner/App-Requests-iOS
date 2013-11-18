//
//  ARDReviewViewController.m
//  App Requests
//
//  Created by App Requests on 5/10/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDReviewViewController.h"
#import "KeychainItemWrapper.h"
#define kTutorialPointProductID @"promoted.ipad.submit"

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
@synthesize alertsuccessful;

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

@synthesize didPromote;
@synthesize itemTitle;
@synthesize itemDescription;
@synthesize submitButton;
@synthesize itemPrice;
//@synthesize product;
@synthesize productID;
@synthesize validProducts;
@synthesize hasAddObserver;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    didPromote = @"NO";
itemTitle.text = @"Loading...";
    itemDescription.text = @"Loading...";
    itemPrice.text = @"Loading...";
    self.navigationItem.title = @"Last chance to prieview before submiting";
    [super viewDidLoad];
    
    //UIBarButtonItem *accountTools = [[UIBarButtonItem alloc] initWithTitle:@"Account Tools" style:UIBarButtonItemStylePlain target:self action:@selector(accountTools:)];
   // self.navigationItem.rightBarButtonItem = accountTools;
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
    submitButton.enabled = NO;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self fetchAvailableProducts];

	// Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated {
}
- (void)viewDidDisappear:(BOOL)animated {
    didPromote = @"NO";
    itemTitle.text = @"Loading...";
    itemDescription.text = @"Loading...";
     itemPrice.text = @"Loading...";
    productID = nil;
    validProducts =nil;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    
-(void)fetchAvailableProducts{
    NSSet *productIdentifiers = [NSSet
                                 setWithObjects:kTutorialPointProductID, nil ];
    productsRequest = [[SKProductsRequest alloc]
                       initWithProductIdentifiers:productIdentifiers];
    productsRequest.delegate = self;
    [productsRequest start];
}

- (BOOL)canMakePurchases
{
    return [SKPaymentQueue canMakePayments];
}
- (void)purchaseMyProduct:(SKProduct*)product{
   if ([self canMakePurchases]) {
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];

        SKPayment *payment = [SKPayment paymentWithProduct:product];
  [[SKPaymentQueue defaultQueue] addPayment:payment];
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
                                  @"Purchases are disabled in your device" message:nil delegate:
                                  self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }
}


#pragma mark StoreKit Delegate

-(void)paymentQueue:(SKPaymentQueue *)queue
updatedTransactions:(NSArray *)transactions {
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchasing:
                NSLog(@"Purchasing");
                break;
            case SKPaymentTransactionStatePurchased:
                if ([transaction.payment.productIdentifier
                     isEqualToString:kTutorialPointProductID]) {
                    NSLog(@"Purchased ");
                    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];

                        didPromote = @"YES";
                    [self completeTransaction:transaction];
                    submitButton.enabled = YES;
                }
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                
                [self performSelector:@selector(submit:) withObject:nil afterDelay:0.0];

                break;
            case SKPaymentTransactionStateRestored:
                NSLog(@"Restored ");
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                NSLog(@"Purchase failed ");
                submitButton.enabled = YES;
                break;
            default:
                break;
        }
    }
}
- (void)completeTransaction:(SKPaymentTransaction *)transaction
{
    NSLog(@"completeTransaction... %@", [[transaction class] description]);
    
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
}
-(void)productsRequest:(SKProductsRequest *)request
    didReceiveResponse:(SKProductsResponse *)response
{
    SKProduct *validProduct = nil;
    int count = [response.products count];
    if (count>0) {
        validProducts = [response.products retain];
        validProduct = [response.products objectAtIndex:0];
        if ([validProduct.productIdentifier
             isEqualToString:kTutorialPointProductID]) {
            [itemTitle setText:[NSString stringWithFormat:
                                        @"%@",validProduct.localizedTitle]];
            [itemDescription setText:[NSString stringWithFormat:
                                              @"%@",validProduct.localizedDescription]];
            [itemPrice setText:[NSString stringWithFormat:
                                        @"$%@",validProduct.price]];
        }
    } else {
        UIAlertView *tmp = [[UIAlertView alloc]
                            initWithTitle:@"Not Available"
                            message:@"No products to purchase"
                            delegate:self
                            cancelButtonTitle:nil
                            otherButtonTitles:@"Ok", nil];
        [tmp show];
    }    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    submitButton.enabled= YES;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if ([alertView.title isEqual: @"Purchase?"]) {
        
    if (buttonIndex == 1) {
        NSLog(@"%@",[validProducts objectAtIndex:0]);
        SKProduct *theProduct = [validProducts objectAtIndex:0];
        [self purchaseMyProduct:theProduct];

        //[self purchaseMyProduct];
        submitButton.enabled = NO;
    } else {
        [self performSelector:@selector(submit:) withObject:nil afterDelay:0.0];

    }
}
}
-(IBAction)purchase:(id)sender{
    if ([didPromote isEqual: @"NO"]) {
    UIAlertView *askPromote = [[[UIAlertView alloc] initWithTitle:@"Purchase?" message:@"Do you want to purchase a promotion so your app idea appears in a new color, is instantly available without review time, and shows in the promoted section?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:nil] autorelease];
    // optional - add more buttons:
    [askPromote addButtonWithTitle:@"Yes"];
    [askPromote show];
    } else {
        [self submit:self];
    }
}

- (IBAction)submit:(id)sender {
    

    KeychainItemWrapper *keychain =  [[KeychainItemWrapper alloc] initWithIdentifier:@"logindetails" accessGroup:nil];
    
    NSString *prePost =[NSString stringWithFormat:@"userid=%@&title=%@&description=%@&license=%@&email=%@&twitter=%@&phone=%@&imessage=%@&appnet=%@&skype=%@&othername=%@&otherhandle=%@&catagory=%@&agerestriction=%@&secret=IfYouAreReadingThisThenSendMeAnEmailAndTellMeYouReadThis&email=%@&password=%@&promoted=%@", userID,titleLabel.text, descriptionText.text, licenseText.text, emailLabel.text, twitterLabel.text, phoneLabel.text,iMessageLabel.text, appnetLabel.text, skypeLabel.text, otherNameLabel.text, otherHandleLabel.text,catagoryLabel.text, ageRestrictionLabel.text, [keychain objectForKey:(id)kSecAttrAccount], [keychain objectForKey:(id)kSecValueData], didPromote];
    NSString *post = [prePost stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *hostStr = @"http://turboe.co/AppRequests/in-app/submissions/submit.php?";
    hostStr = [hostStr stringByAppendingString:post];
    NSData *dataURL =  [NSData dataWithContentsOfURL: [ NSURL URLWithString: hostStr ]];
    NSLog(@"%@%@", hostStr, post);
    
    NSString *serverOutput = [[NSString alloc] initWithData:dataURL encoding: NSASCIIStringEncoding];
    NSLog(@"%@", serverOutput);
    
    
    
    
    
    
    if([serverOutput isEqualToString:@"submitted"]){
        
        
        alertsuccessful = [[UIAlertView alloc] initWithTitle:@"Submission Successful" message:@"Please allow 24hr before your idea is browsable in the app. If you promoted your app idea it will be browsable in the app instantly, check the \"Newest Additions\" section."
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
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
    [premissionsLabel release];
    [itemPrice release];
    [submitButton release];
    [super dealloc];
}
@end

