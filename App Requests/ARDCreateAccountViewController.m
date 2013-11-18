//
//  ARDLoginViewController.m
//  App Requests
//
//  Created by App Requests on 5/5/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDCreateAccountViewController.h"
@interface ARDCreateAccountViewController ()
@end

@implementation ARDCreateAccountViewController
@synthesize nameField;
@synthesize emailField;
@synthesize passwordField;
@synthesize passwordConfirm;
@synthesize createAccountButton;
@synthesize picker;
@synthesize birthDateLabel;
@synthesize birthDateLabelText;
@synthesize birthDateLabelPicker;
@synthesize nameString;
@synthesize emailString;
@synthesize birthString;
@synthesize noErrors;
@synthesize fullName;
-(void)viewDidLoad {
    
}

-(void)viewDidAppear:(BOOL)animated {
    // Update the UI elements with the saved data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults addObserver:self forKeyPath:@"birthstring" options:NSKeyValueObservingOptionNew context:NULL];
    
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *birthDateLabelInString = [defaults objectForKey:@"birthstring"];
    birthDateLabelText.text = birthDateLabelInString;
    NSLog(@"Output : %@ changed property %@ to value %@", object, keyPath, change);
}
- (BOOL) textFieldShouldReturn:(UITextField *) textField {
    
    [[self.view viewWithTag:textField.tag+1] becomeFirstResponder];
    return YES;
    
}


-(void)viewDidDisappear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObserver:self forKeyPath:@"birthstring"];
}


- (IBAction)cancelCreateAccount:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)donePickingBirth:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (IBAction)birthDateViewSwitch:(id)sender {
    NSDate *now = [NSDate date];
    [picker setDate:now animated:YES];
}

-(IBAction)getDate:(id)sender {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"MM/dd/yyyy"];
    NSString *birthDateLabelInString = [outputFormatter stringFromDate:self.picker.date];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:birthDateLabelInString forKey:@"birthstring"];
    birthDateLabel.text = birthDateLabelInString;
    
}


//////////////// User
//////////////// Clicks
//////////////// Sign
//////////////// Up
//////////////// And
//////////////// All
//////////////// This
//////////////// Happens
////////////////
////////////////
////////////////
////////////////
////////////////
- (IBAction) createAccount:(id)sender {
    noErrors=@"YES";
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    //Valid email address
    if ([passwordField.text isEqualToString:passwordConfirm.text]) {
        NSLog(@"passwords match");
    } else {
        noErrors = @"NO";
        passwordConfirm.text=@"";
        passwordField.text=@"";
        UIAlertView *passwordalert = [[UIAlertView alloc] initWithTitle:@"Check Password" message:@"Your passwords do not match, please re-enter your password."
                                                               delegate:self cancelButtonTitle:@"OK." otherButtonTitles:nil, nil];
        
        [passwordalert show];
        [passwordalert release];
        
        
    }
    if ([emailTest evaluateWithObject:emailField.text] == YES)
    {
        NSLog(@"email format passed validation");
        
    }
    else
    {
        noErrors = @"NO";
        
        UIAlertView *emailalert = [[UIAlertView alloc] initWithTitle:@"Invalid Email" message:@"Hey, thats not a real email! Check your email for mistakes."
                                                            delegate:self cancelButtonTitle:@"OK." otherButtonTitles:nil, nil];
        
        [emailalert show];
        [emailalert release];
        
        NSLog(@"email format FAILED to pass validation");
    }
    NSLog(@"%@",birthDateLabel.text);
    if ([noErrors isEqual:@"YES"]) {
        if ([birthDateLabel.text isEqual:NULL]) {
            [self performSegueWithIdentifier:@"birthDatePicker" sender:self];
            
            noErrors=@"NO";
            NSLog(@"user needs to be born, rite? Are we ailiens");
        }
    }
    if ([noErrors isEqual: @"YES"]) {
        NSString *prePost =[NSString stringWithFormat:@"name=%@&password=%@&email=%@&birth=%@&secret=IfYouAreReadingThisThenSendMeAnEmailAndTellMeYouReadThis",nameField.text, passwordField.text, emailField.text, birthDateLabelText.text];
        NSString *post = [prePost stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *hostStr = @"http://turboe.co/AppRequests/in-app/account/create-account.php?";
        hostStr = [hostStr stringByAppendingString:post];
        NSData *dataURL =  [NSData dataWithContentsOfURL: [ NSURL URLWithString: hostStr ]];
        
        NSString *serverOutput = [[NSString alloc] initWithData:dataURL encoding: NSASCIIStringEncoding];
        NSLog(@"%@",serverOutput);
        
        
        
        NSLog(@"%@", noErrors);
        
        //DO NOT REMOVE TRAILING SPACES it is a result of server output
        if([serverOutput isEqualToString:@"Created and database created.			"]){
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            /* We may later use this to login automaticly
             NSString *prePost2 =[NSString stringWithFormat:@"password=%@&email=%@&secret=IfYouAreReadingThisThenSendMeAnEmailAndTellMeYouReadThis", passwordField.text, emailField.text];
             NSString *post2 = [prePost2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
             NSString *hostStr2 = @"http://apprequestsapp.tk/in-app/account/get-userid.php?";
             hostStr = [hostStr2 stringByAppendingString:post2];
             NSData *dataURL2 =  [NSData dataWithContentsOfURL: [ NSURL URLWithString: hostStr ]];
             
             NSString *serverOutput2 = [[NSString alloc] initWithData:dataURL2 encoding: NSASCIIStringEncoding];
             NSLog(@"%@",serverOutput2);
             [defaults setObject:serverOutput2 forKey:@"userid"];
             [defaults setObject:nameField.text forKey:@"username"];
             */
            UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Account Creation Successful" message:@"You may now login."
                                                                  delegate:self cancelButtonTitle:@"Yippie!!!" otherButtonTitles:nil, nil];
            
            [alertsuccess show];
            [alertsuccess release];
            
            // get paths from root direcory
            NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
            // get documents path
            NSString *documentsPath = [paths objectAtIndex:0];
            // get the path to our Data/plist file
            NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"user.plist"];
            
            // set the variables to the values in the text fields
            self.nameString = nameField.text;
            self.emailString = [emailField.text lowercaseString];
            NSString *birthDateLabelInString = [defaults objectForKey:@"birthstring"];
            self.birthString = birthDateLabelInString;
            // create dictionary with values in UITextFields
            NSDictionary *plistDict = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: nameString, emailString, birthString, nil] forKeys:[NSArray arrayWithObjects:@"name", @"email", @"birth", nil]];
            
            NSString *error = nil;
            // create NSData from dictionary
            NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
            
            // check is plistData exists
            if(plistData)
            {
                // write plistData to our Data.plist file
                [plistData writeToFile:plistPath atomically:YES];
            }
            else
            {
                NSLog(@"Error in saveData: %@", error);
                [error release];
            }
            
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
            //DO NOT REMOVE TRAILING SPACES it is a result of server output
        } else if ([serverOutput isEqualToString:@"email taken"]){
            UIAlertView *emailalert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"This email has already been taken, if you beieve this is an error, contact us."
                                                                delegate:self cancelButtonTitle:@"Fine then!" otherButtonTitles:nil, nil];
            [emailalert show];
            [emailalert release];
            
        }
        
        else {
            UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Error" message:@"We are sorry, but an error has been encountered, please try agian later."
                                                                  delegate:self cancelButtonTitle:@"Blame the dev's..." otherButtonTitles:nil, nil];
            [alertsuccess show];
            [alertsuccess release];
            
        }
        
    }
}
//////////////// User
//////////////// Clicks
//////////////// Sign
//////////////// Up
//////////////// And
//////////////// All
//////////////// This
//////////////// Happens
//////////////// (see
//////////////// above)
//////////////// and
//////////////// love
//////////////// isaiah

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn’t have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren’t in use.
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}



@end
