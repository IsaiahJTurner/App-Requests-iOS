//
//  ARDLoginViewController.m
//  App Requests
//
//  Created by App Requests on 5/5/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDLoginViewController.h"
#import "SVStatusHUD.h"
#import "KeychainItemWrapper.h"

@interface ARDLoginViewController ()

@end

@implementation ARDLoginViewController

@synthesize emailField;
@synthesize passwordField;
@synthesize accountLoginButton;
@synthesize valid;

- (void)viewDidLoad {
    KeychainItemWrapper *keychain =
    [[KeychainItemWrapper alloc] initWithIdentifier:@"logindetails" accessGroup:nil];
    emailField.text = [keychain objectForKey:(id)kSecAttrAccount];

}
- (IBAction) accountLogin:(id)sender {

    NSString *post =[NSString stringWithFormat:@"secret=IfYouAreReadingThisThenSendMeAnEmailAndTellMeYouReadThis&email=%@&password=%@",emailField.text, passwordField.text];
    
    NSString *hostStr = @"https://turboe.co/AppRequests/in-app/account/get-userid.php?";
    hostStr = [hostStr stringByAppendingString:post];
    NSData *dataURL =  [NSData dataWithContentsOfURL: [ NSURL URLWithString: hostStr ]];
    NSString *serverOutput = [[NSString alloc] initWithData:dataURL encoding: NSASCIIStringEncoding];
    NSLog(@"%@", serverOutput);
    
    
    
    
    valid = FALSE;
    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:serverOutput];
    valid = [alphaNums isSupersetOfSet:inStringSet];
    
    
    
    
    if([serverOutput isEqualToString:@"not equal"]){
        
        
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Password Incorrect" message:@"Please check your password and try again."
                                                              delegate:self cancelButtonTitle:@"Oh, no!" otherButtonTitles:nil, nil];
        [alertsuccess show];
        [alertsuccess release];
        passwordField.text = @"";
    } else if (!valid) {
   //This will run if the server output in not equal to "not equal" OR if it is not an integer (0-9)
        UIAlertView *alertfail = [[UIAlertView alloc] initWithTitle:@"Login Error" message:@"This error most often means that your email is not yet registered."
                                                              delegate:self cancelButtonTitle:@"Serriously..." otherButtonTitles:nil, nil];
        [alertfail show];
        [alertfail release];
    } else {
        //This code runs if the server outputs an integer, it does not neccessarily mean that authentication worked

        
        //first we save the details to the keychain
        KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"logindetails" accessGroup:nil];
        // Store username to keychain
            [keychain setObject:emailField.text forKey:(id)kSecAttrAccount];
        
        // Store password to keychain
            [keychain setObject:passwordField.text forKey:(id)kSecValueData];
        
        //now we get the name of the logged in user for welcome labels and such
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:serverOutput forKey:@"loginid"];
        NSString *post2 =[NSString stringWithFormat:@"secret=IfYouAreReadingThisThenSendMeAnEmailAndTellMeYouReadThis&id=%@",serverOutput];
        
        NSString *hostStr2 = @"https://turboe.co/AppRequests/in-app/account/get-username.php?";
        hostStr2 = [hostStr2 stringByAppendingString:post2];
        NSData *dataURL2 =  [NSData dataWithContentsOfURL: [ NSURL URLWithString: hostStr2 ]];
        NSString *serverOutput2 = [[NSString alloc] initWithData:dataURL2 encoding: NSASCIIStringEncoding];
        NSLog(@"%@", serverOutput2);
       [defaults setObject:serverOutput2 forKey:@"username"];
        NSLog(@"%@",[defaults objectForKey:@"username"]);
        [self dismissViewControllerAnimated:YES completion:nil];
        [SVStatusHUD showWithImage:[UIImage imageNamed:@"connected.png"] status:@"Logged In"];

    
}
}

- (IBAction)cancelLogin:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}







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
