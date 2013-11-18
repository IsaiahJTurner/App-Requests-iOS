//
//  ARDReviewViewController.h
//  App Requests
//
//  Created by App Requests on 5/10/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDSecondViewController.h"

@interface ARDReviewViewController : ARDSecondViewController {
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
    NSString *emailString;
    NSString *twitterString;
    NSString *phoneString;
    NSString *iMessageString;
    NSString *appnetString;
    NSString *skypeString;
    NSString *otherNameString;
    NSString *otherHandleString;
    NSString *catagoryString;
    NSString *ageRestrictionString;
}
@property (nonatomic, strong) NSString *emailString;
@property (nonatomic, strong) NSString *twitterString;
@property (nonatomic, strong) NSString *phoneString;
@property (nonatomic, strong) NSString *iMessageString;
@property (nonatomic, strong) NSString *appnetString;
@property (nonatomic, strong) NSString *skypeString;
@property (nonatomic, strong) NSString *otherNameString;
@property (nonatomic, strong) NSString *otherHandleString;
@property (nonatomic, strong) NSString *catagoryString;
@property (nonatomic, strong) NSString *ageRestrictionString;
@property (nonatomic,strong) NSString *userID;

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

- (IBAction)dismissModal:(id)sender;
- (IBAction)submit:(id)sender;

@end
