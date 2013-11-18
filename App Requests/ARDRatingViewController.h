//
//  ARDRatingViewController.h
//  App Requests
//
//  Created by App Requests on 5/10/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDSecondViewController.h"

@interface ARDRatingViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    NSString *catagoryString;
    NSString *ageRestrictionString;
    IBOutlet UISegmentedControl *ageRestriction;
    IBOutlet UIPickerView *catagoryPicker;
    
    
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
}
@property (retain, nonatomic) IBOutlet UIWebView *webView;

@property (retain, nonatomic) UIPickerView *catagoryPicker;
@property (strong, nonatomic) NSArray *catagorys;
@property (strong, nonatomic) NSString *catagoryString;
@property (strong, nonatomic) NSString *ageRestrictionString;
@property (strong, nonatomic) UISegmentedControl *ageRestriction;

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

- (IBAction)changeRestriction;
- (IBAction)dismissModal:(id)sender;

@end
