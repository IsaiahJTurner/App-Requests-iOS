//
//  ARDPremissionsViewController.h
//  App Requests
//
//  Created by App Requests on 6/12/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARDPremissionsViewController : UIViewController {
    IBOutlet UISwitch *contentSwitch;
    IBOutlet UISwitch *ratingSwitch;
    IBOutlet UISwitch *contactSwitch;
    NSString *premissions;
    
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
}

@property (nonatomic, strong) UISwitch *contentSwitch;
@property (nonatomic, strong) UISwitch *ratingSwitch;
@property (nonatomic, strong) UISwitch *contactSwitch;
@property (nonatomic, strong) NSString *premissions;
@property (nonatomic, strong) NSString *contentSwitchString;
@property (nonatomic, strong) NSString *ratingSwitchString;
@property (nonatomic, strong) NSString *contactSwitchString;

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

@end
