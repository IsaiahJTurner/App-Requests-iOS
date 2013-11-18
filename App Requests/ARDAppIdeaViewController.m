//
//  ARDAppIdeaViewController.m
//  App Requests
//
//  Created by App Requests on 5/18/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDAppIdeaViewController.h"
#import "KeychainItemWrapper.h"
#import "SVStatusHUD.h"

@interface ARDAppIdeaViewController ()

@end

@implementation ARDAppIdeaViewController
@synthesize ideaInfoMain;
@synthesize idLabel;
@synthesize titleLabel;
@synthesize descriptionText;
@synthesize categoryLabel;
@synthesize ageLabel;
@synthesize likesLabel;
@synthesize twitterLabel;
@synthesize emailLabel;
@synthesize phoneLable;
@synthesize skypeLabel;
@synthesize appnetLabel;
@synthesize iMessageLabel;
@synthesize otherServiceLabel;
@synthesize otherHandleLabel;
@synthesize licenseText;
@synthesize navTitle;
@synthesize flagButton;
@synthesize dislikeButton;
@synthesize likeButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //setting up the navigation bar
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userName = [defaults objectForKey:@"username"];
    if ([defaults objectForKey:@"username"] == nil) {
    navTitle = @"App Idea";

    } else {
    navTitle = [userName stringByAppendingString:@"'s App Idea" ];
        }
    //UIBarButtonItem *accountTools = [[UIBarButtonItem alloc] initWithTitle:@"Account Tools" style:UIBarButtonItemStylePlain target:self action:@selector(accountTools:)];
   // self.navigationItem.rightBarButtonItem = accountTools;
    self.navigationItem.title = navTitle;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;

    NSLog(@"%@",ideaInfoMain);
    NSString *id = [@"Post id: " stringByAppendingString:[ideaInfoMain objectForKey:@"id"]];
    NSLog(@"%@",id);
    idLabel.text = id;
    
    NSString *title = [ideaInfoMain objectForKey:@"title"];
    NSLog(@"%@",title);
    titleLabel.text = title;

    NSString *category = [ideaInfoMain objectForKey:@"catagory"];
    NSLog(@"%@",category);
    categoryLabel.text = category;
    
    NSString *age = [ideaInfoMain objectForKey:@"agerestriction"];
    NSLog(@"%@",age);
    ageLabel.text = age;

    NSString *likes = [ideaInfoMain objectForKey:@"likes"];
    NSLog(@"%@",likes);
    likesLabel.text = likes;
    
    //Now we get the data that wasn't originally retrieved when loading the results table view.
    NSString *postid = [ideaInfoMain objectForKey:@"id"];
    NSString *prePost =[NSString stringWithFormat:@"postid=%@", postid];
    NSString *post = [prePost stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *hostStr = @"http://turboe.co/AppRequests/in-app/submissions/get-idea.php?";
    NSString *finalURLString = [hostStr stringByAppendingString:post];
    NSURL *finalURL = [NSURL URLWithString:finalURLString];
    //NSString *resultsString = [NSString stringWithContentsOfURL:finalURL];
    NSString *returnResults = [[NSString alloc]initWithContentsOfURL:finalURL encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",returnResults);
    NSData *jsData = [returnResults dataUsingEncoding:NSUTF32BigEndianStringEncoding];
    NSDictionary *dictResultsPre = [NSJSONSerialization JSONObjectWithData:jsData options:NSJSONReadingMutableContainers error:NULL];
    NSArray *dictResults = [dictResultsPre objectForKey:@"idea"];
    NSLog(@"%@",dictResultsPre);
    NSLog(@"%@", dictResults);
    NSDictionary *dictResultsFinal = [dictResults objectAtIndex:0];
    
    NSString *description = [dictResultsFinal objectForKey:@"description"];
    NSLog(@"%@",description);
    descriptionText.text = description;

    
    NSString *twitter = [dictResultsFinal objectForKey:@"twitter"];
    NSLog(@"%@",twitter);
    twitterLabel.text = twitter;
    
    NSString *email = [dictResultsFinal objectForKey:@"email"];
    NSLog(@"%@",email);
    emailLabel.text = email;
    
    NSString *phone = [dictResultsFinal objectForKey:@"phone"];
    NSLog(@"%@",phone);
    phoneLabel.text = phone;
    
    NSString *skype = [dictResultsFinal objectForKey:@"skype"];
    NSLog(@"%@",skype);
    skypeLabel.text = skype;
    
    NSString *appnet = [dictResultsFinal objectForKey:@"appnet"];
    NSLog(@"%@",appnet);
    appnetLabel.text = appnet;
    
    NSString *imessage = [dictResultsFinal objectForKey:@"imessage"];
    NSLog(@"%@",imessage);
    iMessageLabel.text = imessage;
    
    NSString *otherservice = [dictResultsFinal objectForKey:@"othername"];
    NSLog(@"%@",otherservice);
    if ([otherservice isEqual: @""]) {
        otherServiceLabel.text= @"Other:";
    } else {
        otherServiceLabel.text = [otherservice stringByAppendingString:@":"];
    }
    NSString *otherhandle = [dictResultsFinal objectForKey:@"otherhandle"];
    NSLog(@"%@",otherhandle);
    otherHandleLabel.text = otherhandle;
    
    NSString *license = [dictResultsFinal objectForKey:@"license"];
    NSLog(@"%@",license);
    licenseText.text = license;
//There is still a few more details we have to get
    NSString *prePost2 =[NSString stringWithFormat:@"id=%@", postid];
    NSString *post2 = [prePost2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *hostStr2 = @"http://turboe.co/AppRequests/in-app/submissions/get-more-details.php?";
    NSString *finalURLString2 = [hostStr2 stringByAppendingString:post2];
    NSURL *finalURL2 = [NSURL URLWithString:finalURLString2];
    //NSString *resultsString = [NSString stringWithContentsOfURL:finalURL];
    
    NSString *returnResults2 = [[NSString alloc]initWithContentsOfURL:finalURL2 encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",returnResults2);
    NSData *jsData2 = [returnResults2 dataUsingEncoding:NSUTF32BigEndianStringEncoding];
    NSDictionary *dictResultsPre2 = [NSJSONSerialization JSONObjectWithData:jsData2 options:NSJSONReadingMutableContainers error:NULL];
    NSArray *dictResults2 = [dictResultsPre2 objectForKey:@"details"];
    NSLog(@"%@",dictResultsPre2);
    NSLog(@"%@", dictResults2);
    NSDictionary *dictResultsFinal2 = [dictResults2 objectAtIndex:0];
    NSLog(@"%@", dictResultsFinal2);

  }

-(IBAction)accountTools:(id)sender {
    [self performSegueWithIdentifier:@"accountTools" sender:self];

}

-(IBAction)likeButtonPressed:(id)sender {
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)likeButton:(id)sender {
    KeychainItemWrapper *keychain =
    [[KeychainItemWrapper alloc] initWithIdentifier:@"logindetails" accessGroup:nil];
    
    NSString *prePost =[NSString stringWithFormat:@"email=%@&password=%@&postid=%@&actiontype=like&secret=IfYouAreReadingThisThenSendMeAnEmailAndTellMeYouReadThis", [keychain objectForKey:(id)kSecAttrAccount], [keychain objectForKey:(id)kSecValueData], [idLabel.text stringByReplacingOccurrencesOfString:@"Post id: " withString:@""]];
    NSString *post = [prePost stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *hostStr = @"http://turboe.co/AppRequests/in-app/account/like.php?";
    hostStr = [hostStr stringByAppendingString:post];
    NSData *dataURL =  [NSData dataWithContentsOfURL: [ NSURL URLWithString: hostStr ]];
    NSLog(@"%@%@", hostStr, post);
    
    NSString *serverOutput = [[NSString alloc] initWithData:dataURL encoding: NSASCIIStringEncoding];
    NSLog(@"%@", serverOutput);
    
    
    
    
    
    
    if([serverOutput isEqualToString:@"liked"]){
        
        [SVStatusHUD showWithImage:[UIImage imageNamed:@"connected.png"] status:@"Liked"];
        int likesInt =  [likesLabel.text intValue];
        int addedLike = likesInt + 1;
        likesLabel.text = [NSString stringWithFormat:@"%d", addedLike];
    } else if([serverOutput isEqualToString:@"authentication failed"]){
        
        
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Please Login" message:@"You can login by tapping account tools in the top right corner of the app."
                                                              delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertsuccess show];
        [alertsuccess release];
        
        
    } else if ([serverOutput isEqualToString:@"already liked"]) {
        
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"already liked" message:@"Silly you, did you really think you could like a post more than once!"
                                                              delegate:self cancelButtonTitle:@"Oh, yeah." otherButtonTitles:nil, nil];
        [alertsuccess show];
        [alertsuccess release];
    }
    else {
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Failed to like" message:@"Thats weird, your like doesn't seem to have gone through. You could try again but you might need to contact support."
                                                              delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertsuccess show];
        [alertsuccess release];    }

}


@end
