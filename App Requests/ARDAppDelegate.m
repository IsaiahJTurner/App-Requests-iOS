//
//  ARDAppDelegate.m
//  App Requests
//
//  Created by App Requests on 4/7/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDAppDelegate.h"
#import "SVStatusHUD.h"
#import "MBProgressHUD.h"
#import "Reachability.h"
#import "Parse/Parse.h"
#import "TestFlight.h"
#import "Apsalar.h"

//#import "ARDFirstViewController.h"
//#import "ARDSecondViewController.h"
//#import "ARDAccountViewController.h"
//#import "ARDCreateAccountViewController.h"

@implementation ARDAppDelegate
@synthesize window;
@synthesize buttonTitle;
@synthesize alert;
@synthesize resumingApp;
@synthesize myTimer;
@synthesize startTimer;
@synthesize doNotResumeApp;

#pragma mark - UIApplicationDelegate
- (void)dealloc
{    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //[TestFlight setDeviceIdentifier:[[UIDevice currentDevice] uniqueIdentifier]];
    
    
    
    
    
    
    
    
    
    [TestFlight takeOff:@"30190738-3267-4d90-96c5-19f61542dd65"];
    // Override point for customization after application launch.
    // ****************************************************************************
    // Uncomment and fill in with your Parse credentials:
    // [Parse setApplicationId:@"your_application_id" clientKey:@"your_client_key"];
    [Parse setApplicationId:@"eGM4DwTX4gCjF6fKIglbkYTv0tBCojYMWCtJHw7g" clientKey:@"KvtSdm4R4QlGOpfayYutbSp0ZIFEWEJJFCZI35mx"];
    [PFFacebookUtils initializeWithApplicationId:@"591189427560737"];
    [PFTwitterUtils initializeWithConsumerKey:@"7ej34wcgbiwVG1mCJbygQ" consumerSecret:@"BptJXELzrq162klZYaLjdTpAHW8Jz4xU15BtCSlKY"];


    // If you are using Facebook, uncomment and add your FacebookAppID to your bundle's plist as
    // described here: https://developers.facebook.com/docs/getting-started/facebook-sdk-for-ios/
    // [PFFacebookUtils initializeFacebook];
    // ****************************************************************************
    
    
    //\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
    NSString *deviceType = [UIDevice currentDevice].model;

    if([deviceType isEqualToString:@"iPhone"]) {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            //move to iphone4 storyboard
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard_iPhone_Small" bundle:nil];
            UIViewController *initialViewController = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"mainController"];
            self.window.rootViewController = initialViewController;        }
        if(result.height == 568)
        {
            //move to iphone5 storyboard
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard_iPhone" bundle:nil];
            UIViewController *initialViewController = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"mainController"];
            self.window.rootViewController = initialViewController;        }


    } else {

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard_iPad" bundle:nil];
    UIViewController *initialViewController = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"mainController"];
    self.window.rootViewController = initialViewController;
    }
    //\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
    
    
    [PFUser enableAutomaticUser];
    
    PFACL *defaultACL = [PFACL ACL];
    
    // If you would like all objects to be private by default, remove this line.
    [defaultACL setPublicReadAccess:YES];
    
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
        
  //  [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge|
     UIRemoteNotificationTypeAlert|
     UIRemoteNotificationTypeSound];
    startTimer = TRUE;

    [self performSelector: @selector(networkStuff) withObject:self afterDelay: 0.0];
    
    return YES;
   

}


  - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
 sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
         
          [Apsalar startSession:@"TurboeCreations" withKey:@"JPGeciIz" andURL:url];
          return YES;
 return [PFFacebookUtils handleOpenURL:url];
          
 }
 
 

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)newDeviceToken {
    [PFPush storeDeviceToken:newDeviceToken];
    [PFPush subscribeToChannelInBackground:@"" target:self selector:@selector(subscribeFinished:error:)];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    if (error.code == 3010) {
        NSLog(@"Push notifications are not supported in the iOS Simulator.");
    } else {
        // show some alert or otherwise handle the failure to register.
        NSLog(@"application:didFailToRegisterForRemoteNotificationsWithError: %@", error);
	}
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
    
    if (application.applicationState != UIApplicationStateActive) {
   //     [PFAnalytics trackAppOpenedWithRemoteNotificationPayload:userInfo];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    // the user clicked one of the OK/Cancel buttons

    if ([buttonTitle isEqualToString: @"update"]){
                      NSLog(@"opening app store");
                      [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://turboe.co/AppRequests/in-app/update.php"]];
        resumingApp = FALSE;
        startTimer = FALSE;
        [self performSelector: @selector(checkNetwork:) withObject:self afterDelay: 0.0];
    }
    if ([buttonTitle isEqualToString: @"retry"]){
        NSLog(@"retrying");
        resumingApp = TRUE;
        startTimer = TRUE;
        [self performSelector: @selector(checkNetwork:) withObject:self afterDelay: 0.0];

    }
    if ([buttonTitle isEqualToString: @"rate"]){
        doNotResumeApp = TRUE;
        NSLog(@"rating");
        [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://turboe.co/AppRequests/in-app/rate.php"]];

    }
    
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%@",error);
}
- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}


-(void)applicationDidBecomeActive:(UIApplication *)application {
    [Apsalar startSession:@"TurboeCreations" withKey:@"JPGeciIz"];
 
    
    
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger appLaunchAmounts = [userDefaults integerForKey:@"LaunchAmounts"];
    if (appLaunchAmounts == 10)
    {
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Like App Requests?" message:@"If you like App Requests consider rating it in the App Store."
                                                              delegate:self cancelButtonTitle:nil/*@"No thanks \ue40e"*/ otherButtonTitles:@"Sure \ue057", nil];
        //This next varriable is used in the alert view action to identify what alert was shown
        buttonTitle = @"rate";
        [alertsuccess show];
        [alertsuccess release];
    }
    [userDefaults setInteger:appLaunchAmounts+1 forKey:@"LaunchAmounts"];
    if (doNotResumeApp==TRUE) {
        NSLog(@"the varrable doNotResumeApp is preventing the app from resuming");
    } else {
    resumingApp = TRUE;

        startTimer = TRUE;
    }
   
}

-(void)checkNetwork:(NSTimer *)theTimer  {
    Reachability *curReach = [[Reachability reachabilityForInternetConnection] retain];
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    switch (netStatus) {
        case NotReachable: {
            startTimer = FALSE;
            [self performSelector: @selector(networkStuff) withObject:self afterDelay: 0.0];
            UIAlertView *alertreach = [[UIAlertView alloc] initWithTitle:@"Not Connected" message:@"Please connect to the internet and tap retry."
                                                                delegate:self cancelButtonTitle:nil otherButtonTitles:@"Retry", nil];
            //This next varriable is used in the alert view action to identify what alert was shown
            buttonTitle = @"retry";
            [alertreach show];
            [alertreach release];
            
        }
        case ReachableViaWiFi: {
           // NSLog(@"code run");
            //startTimer = TRUE;
            //[self performSelector: @selector(networkStuff) withObject:self afterDelay: 0.0];
            if (resumingApp){
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
            NSData *dataURL =  [NSData dataWithContentsOfURL: [NSURL URLWithString:@"http://turboe.co/AppRequests/in-app/nettest.php?v=b1.0" ]];
            NSString *serverOutput = [[NSString alloc] initWithData:dataURL encoding: NSASCIIStringEncoding];
            NSLog(@"%@", serverOutput);
            
            if([serverOutput isEqualToString:@"internet is working"])
            {
                if (resumingApp) {
                    [SVStatusHUD showWithImage:[UIImage imageNamed:@"connected.png"] status:@"Connected"];
                }
            } else if ([serverOutput isEqualToString:@"updated"]){
                startTimer=FALSE;
                [self performSelector: @selector(networkStuff) withObject:self afterDelay: 0.0];
                doNotResumeApp = TRUE;
                UIAlertView *alertupdate = [[UIAlertView alloc] initWithTitle:@"Update Available" message:@"An update is available for App Requests, you must update to continue using the app."
                                                                     delegate:self cancelButtonTitle:nil otherButtonTitles:@"Get Update", nil];
                //This next varriable is used in the alert view action to identify what alert was shown
                buttonTitle = @"update";
                [alertupdate show];
                [alertupdate release];
                
                
            }
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            }
            
        }
        case ReachableViaWWAN: {
            //NSLog(@"other code run");
            //startTimer = TRUE;
            //[self performSelector: @selector(networkStuff) withObject:self afterDelay: 0.0];
            if (resumingApp) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
            NSData *dataURL =  [NSData dataWithContentsOfURL: [NSURL URLWithString:@"http://turboe.co/AppRequests/in-app/nettest.php?v=b1.0" ]];
            NSString *serverOutput = [[NSString alloc] initWithData:dataURL encoding: NSASCIIStringEncoding];
            NSLog(@"%@", serverOutput);
            
            if([serverOutput isEqualToString:@"internet is working"])
            {
                if (resumingApp) {
                    [SVStatusHUD showWithImage:[UIImage imageNamed:@"connected.png"] status:@"Connected"];
                }
            } else if ([serverOutput isEqualToString:@"updated"]){
                startTimer=FALSE;
                [self performSelector: @selector(networkStuff) withObject:self afterDelay: 0.0];
                doNotResumeApp = TRUE;
                UIAlertView *alertupdate = [[UIAlertView alloc] initWithTitle:@"Update Available" message:@"An update is available for App Requests, you must update to continue using the app."
                                                                     delegate:self cancelButtonTitle:nil otherButtonTitles:@"Get Update", nil];
                //This next varriable is used in the alert view action to identify what alert was shown
                buttonTitle = @"update";
                [alertupdate show];
                [alertupdate release];
                
                
            }
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            }
            
        }
            
    }
    resumingApp = FALSE;
}


-(void)networkStuff {
    if (startTimer==TRUE) {
        myTimer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(checkNetwork:) userInfo:nil repeats: YES];
        [[NSRunLoop currentRunLoop] addTimer:myTimer forMode:NSDefaultRunLoopMode];
    }
    if (startTimer==FALSE) {
        [myTimer invalidate];
        myTimer = nil;
    }

}



#pragma mark - ()
- (void)subscribeFinished:(NSNumber *)result error:(NSError *)error {
    if ([result boolValue]) {
        NSLog(@"App Requests successfully subscribed to push notifications on the broadcast channel.");
    } else {
        NSLog(@"App Requests failed to subscribe to push notifications on the broadcast channel.");
    }
}

@end
