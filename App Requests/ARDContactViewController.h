//
//  ARDContactViewController.h
//  App Requests
//
//  Created by App Requests on 5/10/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDSecondViewController.h"

@interface ARDContactViewController : UIViewController <UITextFieldDelegate> {
    
    IBOutlet UITextField *emailField;    
    IBOutlet UITextField *twitterField;
    IBOutlet UITextField *phoneField;
    IBOutlet UITextField *iMessageField;
    IBOutlet UITextField *appnetField;
    IBOutlet UITextField *skypeField;
    IBOutlet UITextField *otherNameField;
    IBOutlet UITextField *otherHandleField;
     
    //From VC stepOne
    NSString *titleString;
    NSString *licenseString;
    NSString *descriptionString;
}

@property (nonatomic, strong) UITextField *emailField;
@property (nonatomic, strong) UITextField *twitterField;
@property (nonatomic, strong) UITextField *phoneField;
@property (nonatomic, strong) UITextField *iMessageField;
@property (nonatomic, strong) UITextField *appnetField;
@property (nonatomic, strong) UITextField *skypeField;
@property (nonatomic, strong) UITextField *otherNameField;
@property (nonatomic, strong) UITextField *otherHandleField;

//From VC step ONE
@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, strong) NSString *licenseString;
@property (nonatomic, strong) NSString *descriptionString;

- (IBAction)saveData;
- (IBAction)dismissModal:(id)sender;

@end
