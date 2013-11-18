//
//  ARDLoginViewController.h
//  App Requests
//
//  Created by App Requests on 5/5/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//
#import "UIKit/UIKit.h"


@interface ARDCreateAccountViewController : UIViewController <UITextFieldDelegate> {
    
    IBOutlet UITextField *nameField;
    IBOutlet UITextField *emailField;
    IBOutlet UITextField *passwordField;
    IBOutlet UITextField *passwordConfirm;
    IBOutlet UIButton *createAccountButton;
    IBOutlet UILabel *birthDateLabel;
    IBOutlet UILabel *birthDateLabelText;
    IBOutlet UILabel *birthDateLabelPicker;
    NSString *nameString;
    NSString *emailString;
    NSString *birthString;
    NSString *fullName;
}


@property (nonatomic, retain) UITextField *nameField;
@property (nonatomic, retain) UITextField *emailField;
@property (nonatomic, retain) UITextField *passwordField;
@property (nonatomic, retain) UITextField *passwordConfirm;
@property (nonatomic, retain) UIButton *createAccountButton;
@property(strong, nonatomic) UILabel *birthDateLabel;
@property(strong, nonatomic) UILabel *birthDateLabelText;
@property(strong, nonatomic) UILabel *birthDateLabelPicker;
@property(nonatomic, strong) NSString *noErrors;
@property(nonatomic, strong) NSString *nameString;
@property(nonatomic, strong) NSString *emailString;
@property(nonatomic, strong) NSString *birthString;
@property(nonatomic, strong) NSString *fullName;
@property (strong, nonatomic) IBOutlet UIDatePicker *picker;

- (IBAction)donePickingBirth:(id)sender;
- (IBAction)birthDateViewSwitch:(id)sender;
- (IBAction)createAccount:(id)sender;
- (IBAction)cancelCreateAccount:(id)sender;


@end
