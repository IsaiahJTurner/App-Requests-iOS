//
//  ARDContactViewController.h
//  App Requests
//
//  Created by App Requests on 5/10/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDSecondViewController.h"

@interface ARDContactViewController : ARDSecondViewController <UITextFieldDelegate> {
    
    IBOutlet UITextField *emailField;    
    IBOutlet UITextField *twitterField;
    IBOutlet UITextField *phoneField;
    IBOutlet UITextField *iMessageField;
    IBOutlet UITextField *appnetField;
    IBOutlet UITextField *skypeField;
    IBOutlet UITextField *otherNameField;
    IBOutlet UITextField *otherHandleField;
    NSString *emailString;
    NSString *twitterString;
    NSString *phoneString;
    NSString *iMessageString;
    NSString *appnetString;
    NSString *skypeString;
    NSString *otherNameString;
    NSString *otherHandleString;
}
@property (nonatomic, strong) UITextField *emailField;
@property (nonatomic, strong) UITextField *twitterField;
@property (nonatomic, strong) UITextField *phoneField;
@property (nonatomic, strong) UITextField *iMessageField;
@property (nonatomic, strong) UITextField *appnetField;
@property (nonatomic, strong) UITextField *skypeField;
@property (nonatomic, strong) UITextField *otherNameField;
@property (nonatomic, strong) UITextField *otherHandleField;

@property (nonatomic, strong) NSString *emailString;
@property (nonatomic, strong) NSString *twitterString;
@property (nonatomic, strong) NSString *phoneString;
@property (nonatomic, strong) NSString *iMessageString;
@property (nonatomic, strong) NSString *appnetString;
@property (nonatomic, strong) NSString *skypeString;
@property (nonatomic, strong) NSString *otherNameString;
@property (nonatomic, strong) NSString *otherHandleString;

- (IBAction)saveData;
- (IBAction)dismissModal:(id)sender;

@end
