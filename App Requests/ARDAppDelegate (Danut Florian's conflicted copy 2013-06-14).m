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


//#import "ARDFirstViewController.h"
//#import "ARDSecondViewController.h"
//#import "ARDAccountViewController.h"
//#import "ARDCreateAccountViewController.h"

@implementation ARDAppDelegate
@synthesize window;
@synthesize buttonTitle;
@synthesize alert;

#pragma mark - UIApplicationDelegate
- (void)dealloc
{    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
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
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil];
    UIViewController *initialViewController = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"mainController"];
    self.window.rootViewController = initialViewController;
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
    return YES;
//This is the code that constantly visits the page checking for internet
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(checkNetwork) userInfo:nil repeats:YES];

}


  - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
 sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
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

- (void)applicationDidBecomeActive:(UIApplication *)application {
//    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
  //  MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    //hud.labelText = @"title";

}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    // the user clicked one of the OK/Cancel buttons

    if (buttonIndex == 0) {
        NSLog(@"quiting app");
        alert = [[[UIAlertView alloc] initWithTitle:@"\n\nWaiting for internet."
                                            message:@"A network test will be preformed in 5 seconds" delegate:self cancelButtonTitle:nil otherButtonTitles: nil] autorelease];
        [alert show];
        
              } else {
                  if ([buttonTitle isEqualToString: @"settings"]) {
                      /*
                       We could use this to open settings, reme
                       //This is a non-public API AND MUST BE REMOVED! I want to find an alternative to open the settings app
                      void (*openApp)(CFStringRef, Boolean);
                      void *hndl = dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices");
                      openApp = dlsym(hndl, "SBSLaunchApplicationWithIdentifier");
                      openApp(CFSTR("com.apple.Preferences"), FALSE);
                      //End Non-Public API
                      NSLog(@"opening setting");*/
                      
                  } else if ([buttonTitle isEqualToString: @"update"]){
                      NSLog(@"opening app store");
                      [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://apple.com/app/AppRequests"]];

                  }
                  
                    }
            }

-(void)checkNetwork {
    [alert release];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSData *dataURL =  [NSData dataWithContentsOfURL: [NSURL URLWithString:@"http://apprequestsapp.tk/in-app/net.test" ]];
    NSString *serverOutput = [[NSString alloc] initWithData:dataURL encoding: NSASCIIStringEncoding];
    NSLog(@"%@", serverOutput);
    
    if([serverOutput isEqualToString:@"internet is working"])
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//do nothing if internet is working, you could NSLog (@"internet working") if you wanted to get a internet echo every 5 seconds
    } else if ([serverOutput isEqualToString:@"updated"]){
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Update Available" message:@"An update is available for App Requests, you must update to continue using the app."
                                                              delegate:self cancelButtonTitle:nil otherButtonTitles:@"Get Update", nil];
        //This next varriable is used in the alert view action to identify what alert was shown
        buttonTitle = @"update";
        [alertsuccess show];
        [alertsuccess release];
        
        
    } else {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Connection Unsuccesful" message:@"App Requests has failed connecting to the server. An internet connection is required to continue."
                                                              delegate:self cancelButtonTitle:@"Keep Checking" otherButtonTitles:nil, nil];
        buttonTitle = @"settings";
        [alertsuccess show];
        [alertsuccess release];
        alert = [[[UIAlertView alloc] initWithTitle:@"\n\nWaiting for internet."
                                            message:@"A network test will be preformed in 5 seconds" delegate:self cancelButtonTitle:nil otherButtonTitles: nil] autorelease];
        [alert show];

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


#pragma mark - ()
- (void)subscribeFinished:(NSNumber *)result error:(NSError *)error {
    if ([result boolValue]) {
        NSLog(@"App Requests successfully subscribed to push notifications on the broadcast channel.");
    } else {
        NSLog(@"App Requests failed to subscribe to push notifications on the broadcast channel.");
    }
}

- (void)myTask {
	// Do something usefull in here instead of sleeping ...
	sleep(3);
}

@end
