//
//  ARDFirstViewController.m
//  App Requests
//
//  Created by App Requests on 4/7/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDFirstViewController.h"
#import "UIKit/UIKit.h"
#import "QuartzCore/QuartzCore.h"
#import "ARDResultsReturnedViewController.h"

@interface ARDFirstViewController () {
    NSMutableArray *_objects;
}

@end

@implementation ARDFirstViewController
@synthesize results;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Browse App Ideas";
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
}

- (IBAction)mostLikes:(id)sender {
    
    NSString *hostStr = @"http://turboe.co/AppRequests/in-app/submissions/by-likes.php";
    NSURL *finalURL = [NSURL URLWithString:hostStr];
    
    NSString *returnResults = [[NSString alloc]initWithContentsOfURL:finalURL encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",returnResults);
    NSData *jsData = [returnResults dataUsingEncoding:NSUTF32BigEndianStringEncoding];
    
    NSDictionary *dictResults = [NSJSONSerialization JSONObjectWithData:jsData options:NSJSONReadingMutableContainers error:NULL];
    
    NSLog(@"%@", hostStr);
    NSLog(@"%@", dictResults);
    
    //Now we will switch to the results view controller
    ARDResultsReturnedViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"resultsVC"];
    vc.dictResults = dictResults;
    vc.sortBy = @"likes";
    vc.titleString = @"Most Likes";
    [self.navigationController pushViewController:vc animated:YES];
   // [vc release];
    
}

- (IBAction)previouslyPromoted:(id)sender {
    NSString *hostStr = @"http://turboe.co/AppRequests/in-app/submissions/previously-promoted.php";
    NSURL *finalURL = [NSURL URLWithString:hostStr];
    
    NSString *returnResults = [[NSString alloc]initWithContentsOfURL:finalURL encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",returnResults);
    NSData *jsData = [returnResults dataUsingEncoding:NSUTF32BigEndianStringEncoding];
    
    NSDictionary *dictResults = [NSJSONSerialization JSONObjectWithData:jsData options:NSJSONReadingMutableContainers error:NULL];
    
    NSLog(@"%@", hostStr);
    NSLog(@"%@", dictResults);
    
    //Now we will switch to the results view controller
    ARDResultsReturnedViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"resultsVC"];
    vc.dictResults = dictResults;
    vc.sortBy = @"likes";
    vc.titleString = @"Promoted";
    [self.navigationController pushViewController:vc animated:YES];
    // [vc release];
    

}

- (IBAction)newestAditions:(id)sender {
    NSString *hostStr = @"http://turboe.co/AppRequests/in-app/submissions/newest-additions.php";
    NSURL *finalURL = [NSURL URLWithString:hostStr];
    
    NSString *returnResults = [[NSString alloc]initWithContentsOfURL:finalURL encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",returnResults);
    NSData *jsData = [returnResults dataUsingEncoding:NSUTF32BigEndianStringEncoding];
    
    NSDictionary *dictResults = [NSJSONSerialization JSONObjectWithData:jsData options:NSJSONReadingMutableContainers error:NULL];
    
    NSLog(@"%@", hostStr);
    NSLog(@"%@", dictResults);
    
    //Now we will switch to the results view controller
    ARDResultsReturnedViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"resultsVC"];
    vc.dictResults = dictResults;
    vc.sortBy = @"likes";
    vc.titleString = @"Newest Additions";
    [self.navigationController pushViewController:vc animated:YES];
    // [vc release];
    

}

- (IBAction)developerPicks:(id)sender {
    NSString *hostStr = @"http://turboe.co/AppRequests/in-app/submissions/developer-picks.php";
    NSURL *finalURL = [NSURL URLWithString:hostStr];
    
    NSString *returnResults = [[NSString alloc]initWithContentsOfURL:finalURL encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",returnResults);
    NSData *jsData = [returnResults dataUsingEncoding:NSUTF32BigEndianStringEncoding];
    
    NSDictionary *dictResults = [NSJSONSerialization JSONObjectWithData:jsData options:NSJSONReadingMutableContainers error:NULL];
    
    NSLog(@"%@", hostStr);
    NSLog(@"%@", dictResults);
    
    //Now we will switch to the results view controller
    ARDResultsReturnedViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"resultsVC"];
    vc.dictResults = dictResults;
    vc.sortBy = @"likes";
    vc.titleString = @"Developer Picks";
    [self.navigationController pushViewController:vc animated:YES];
    // [vc release];
    

}

- (IBAction)searchButton:(id)sender {
    //Now we will switch to the search view controller
    ARDResultsReturnedViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"searchVC"];
    vc.sortBy = @"date";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [super dealloc];
}
- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
