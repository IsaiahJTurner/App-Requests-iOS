//
//  ARDReviewViewController.h
//  App Requests
//
//  Created by App Requests on 5/10/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDSecondViewController.h"
#import <StoreKit/StoreKit.h>




@interface ARDReviewViewController : UIViewController <SKPaymentTransactionObserver, SKProductsRequestDelegate, UIAlertViewDelegate> {
    IBOutlet UILabel *itemTitle;
    IBOutlet UITextView *itemDescription;
    IBOutlet UILabel *itemPrice;
    SKProductsRequest *productsRequest;
    NSArray *validProducts;
    NSString *didPromote;
    BOOL hasAddObserver;
    
    IBOutlet UITextView *licenseText;
    IBOutlet UITextView *descriptionText;
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *emailLabel;
    IBOutlet UILabel *twitterLabel;
    IBOutlet UILabel *phoneLabel;
    IBOutlet UILabel *iMessageLabel;
    IBOutlet UILabel *appnetLabel;
    IBOutlet UILabel *skypeLabel;
    IBOutlet UILabel *otherNameLabel;
    IBOutlet UILabel *otherHandleLabel;
    IBOutlet UILabel *catagoryLabel;
    IBOutlet UILabel *ageRestrictionLabel;
    IBOutlet UILabel *loginNameLabel;
    IBOutlet UITextView *premissionsLabel;
    NSString *almostLabel;

    //From VC stepOne
    NSString *titleString;
    NSString *licenseString;
    NSString *descriptionString;
    
    //From VC stepTwo
    NSString *emailString;
    NSString *twitterString;
    NSString *phoneString;
    NSString *iMessageString;
    NSString *appnetString;
    NSString *skypeString;
    NSString *otherNameString;
    NSString *otherHandleString;
    
    //From VC stepThree
    NSString *premissions;
    
    //From VC stepFour
    
    
}
@property (nonatomic) BOOL hasAddObserver;

@property (nonatomic, strong) NSArray *validProducts;
@property (nonatomic, strong) UILabel *itemTitle;
@property (nonatomic, strong) UITextView *itemDescription;
//@property (retain, nonatomic) SKProduct *product;
@property (strong, nonatomic) NSString *productID;
@property (strong, nonatomic) UILabel *itemPrice;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;

@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic,strong) NSString *userID;
@property (nonatomic,strong) NSString *didPromote;

@property (nonatomic,strong) UITextView *licenseText;
@property (nonatomic,strong) UITextView *descriptionText;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *emailLabel;
@property (nonatomic,strong) UILabel *twitterLabel;
@property (nonatomic,strong) UILabel *phoneLabel;
@property (nonatomic,strong) UILabel *iMessageLabel;
@property (nonatomic,strong) UILabel *appnetLabel;
@property (nonatomic,strong) UILabel *skypeLabel;
@property (nonatomic,strong) UILabel *otherNameLabel;
@property (nonatomic,strong) UILabel *otherHandleLabel;
@property (nonatomic,strong) UILabel *catagoryLabel;
@property (nonatomic,strong) UILabel *ageRestrictionLabel;
@property (nonatomic, strong) UILabel *loginNameLabel;
@property (nonatomic,strong) UITextView *premissionsLabel;
@property (nonatomic, strong) NSString *almostLabel;
@property (nonatomic, strong) UIAlertView *alertsuccessful;


//From VC stepOne
@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, strong) NSString *licenseString;
@property (nonatomic, strong) NSString *descriptionString;

//From VC stepTwo
@property (nonatomic, strong) NSString *emailString;
@property (nonatomic, strong) NSString *twitterString;
@property (nonatomic, strong) NSString *phoneString;
@property (nonatomic, strong) NSString *iMessageString;
@property (nonatomic, strong) NSString *appnetString;
@property (nonatomic, strong) NSString *skypeString;
@property (nonatomic, strong) NSString *otherNameString;
@property (nonatomic, strong) NSString *otherHandleString;

//From VC stepThree
@property (nonatomic, strong) NSString *premissions;

//From VC stepFour
@property (nonatomic, strong) NSString *catagoryString;
@property (nonatomic, strong) NSString *ageRestrictionString;

- (IBAction)purchase:(id)sender;
- (void)fetchAvailableProducts;
- (BOOL)canMakePurchases;
- (void)purchaseMyProduct:(SKProduct*)product;

@end
