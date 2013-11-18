//
//  ARDSecondViewController.h
//  App Requests
//
//  Created by App Requests on 4/7/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
@interface ARDSecondViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, UIPopoverControllerDelegate, UITextFieldDelegate> {
    IBOutlet UITextField *titleField;
    IBOutlet UITextView *descriptionField;
    IBOutlet UITextView *licenseField;
    IBOutlet UILabel *charCount;
    IBOutlet UILabel *loginLabel;


}

@property (nonatomic, strong) IBOutlet UILabel *welcomeLabel;

@property (nonatomic, strong) UITextField *titleField;
@property (nonatomic, strong) NSString *usernameString;
@property (nonatomic, strong) UITextView *descriptionField;
@property (nonatomic, strong) UITextView *licenseField;
@property (nonatomic, strong) UILabel *loginLabel;
@property (nonatomic, strong) UILabel *charCount;
@property (nonatomic) int charRemaining;

- (IBAction)logOutButtonTapAction:(id)sender;
- (IBAction)dismissModal:(id)sender;
- (IBAction)saveData;



@end
