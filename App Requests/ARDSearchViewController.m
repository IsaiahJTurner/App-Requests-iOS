//
//  ARDSearchViewController.m
//  App Requests
//
//  Created by App Requests on 6/7/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDSearchViewController.h"
#import "ARDAppIdeaViewController.h"
#import "DejalActivityView.h"
#import "Apsalar.h"
@interface ARDSearchViewController ()

@end

@implementation ARDSearchViewController
@synthesize searchResults;
@synthesize sortBy;
@synthesize searchBar;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [Apsalar event:@"open-search-view"];

    [super viewDidLoad];
    
    [searchBar becomeFirstResponder];
    
    searchResults = [[NSArray alloc] init];
    NSLog(@"%@", searchResults);

    //  self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    
    //setting up the navigation bar
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
        
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1px.png"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    [bgView release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)doneBrowsing:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)dismissModal:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [searchResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
    NSDictionary *preResults = [searchResults objectAtIndex:indexPath.row];
    NSLog(@"%@",preResults);
    NSString *resultTitle = [preResults objectForKey:@"title"];
    NSLog(@"%@",resultTitle);
    cell.textLabel.text = resultTitle;
    if ([[preResults objectForKey:@"promoted"] isEqualToString:@"1"]) {
        cell.contentView.backgroundColor = [UIColor greenColor];
    } else if ([[preResults objectForKey:@"devpick"] isEqualToString:@"1"]) {
        cell.contentView.backgroundColor = [UIColor yellowColor];
    } else {
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.textColor = [UIColor blackColor];
    }
    
    return cell;
};
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *ideaSelected = [searchResults objectAtIndex:indexPath.row];
    NSLog(@"%@",ideaSelected);
    
    //Now we will switch to the idea view controller
    ARDAppIdeaViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ideaVC"];
    vc.ideaInfoMain = ideaSelected;
    //UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.navigationController pushViewController:vc animated:YES];
    // [vc release];
}

#pragma mark - Search view delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [Apsalar event:@"preform-search"];

    [DejalKeyboardActivityView activityView];
    NSString *prePost =[NSString stringWithFormat:@"q=%@", self.searchBar.text];
    NSString *post = [prePost stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *hostStr = @"http://turboe.co/AppRequests/in-app/submissions/search.php?";
    NSString *finalURLString = [hostStr stringByAppendingString:post];
    NSURL *finalURL = [NSURL URLWithString:finalURLString];
    //NSString *resultsString = [NSString stringWithContentsOfURL:finalURL];
    
    NSString *returnResults = [[NSString alloc]initWithContentsOfURL:finalURL encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",returnResults);
    NSData *jsData = [returnResults dataUsingEncoding:NSUTF32BigEndianStringEncoding];
    NSDictionary *searchResultsPre = [NSJSONSerialization JSONObjectWithData:jsData options:NSJSONReadingMutableContainers error:NULL];
    searchResults = [[searchResultsPre objectForKey:@"submissions"] retain];
    NSLog(@"%@", searchResults);
    
    NSLog(@"%@%@", hostStr,prePost);
    NSLog(@"%@", searchResults);
    [self performSelector:@selector(removeActivityView) withObject:nil afterDelay:2.0];
}

- (void)removeActivityView;
{
    [self.tableView reloadData];
    [DejalKeyboardActivityView removeViewAnimated:YES];

}

- (void)dealloc {
    [searchResults release];
    [searchBar release];
    [super dealloc];
}
@end
