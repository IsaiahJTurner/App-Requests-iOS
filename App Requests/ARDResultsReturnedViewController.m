//
//  ARDResultsReturnedViewController.m
//  App Requests
//
//  Created by App Requests on 5/12/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDResultsReturnedViewController.h"
#import "ARDAppIdeaViewController.h"
#import "Apsalar.h"

@interface ARDResultsReturnedViewController ()

@end

@implementation ARDResultsReturnedViewController
@synthesize dictResults;
@synthesize sortBy;
@synthesize titleString;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{

    [super viewDidLoad];

    NSLog(@"%@",dictResults);
  //  self.navigationItem.rightBarButtonItem = self.editButtonItem;


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    //setting up the navigation bar
  //  UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissModal:)];
    //self.navigationItem.leftBarButtonItem = backButton;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;

    //self.navigationItem.leftBarButtonItem = self.navigationItem.backBarButtonItem;

    //[backButton release];
    self.navigationItem.title = titleString;
    [Apsalar event:[titleString stringByAppendingString:@" Results"]];

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
    NSArray *resultsArrayForCount = [dictResults objectForKey:@"submissions"];
    return [resultsArrayForCount count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
    NSArray *preResults = [dictResults objectForKey:@"submissions"];
    NSLog(@"%@",preResults);
    NSDictionary *preResults2 = [preResults objectAtIndex:indexPath.row];
    NSLog(@"%@",preResults2);
    NSString *results = [preResults2 objectForKey:@"title"];
    if ([[preResults2 objectForKey:@"promoted"] isEqualToString:@"1"]) {
        cell.contentView.backgroundColor = [UIColor greenColor];
    } else if ([[preResults2 objectForKey:@"devpick"] isEqualToString:@"1"]) {
        cell.contentView.backgroundColor = [UIColor yellowColor];
    } else {
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.textLabel.textColor = [UIColor blackColor];
    }
    NSLog(@"%@",results);
    cell.textLabel.text = results;
    
    return cell;
};

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *preIdea = [dictResults objectForKey:@"submissions"];
    NSLog(@"%@",preIdea);
    NSDictionary *ideaSelected = [preIdea objectAtIndex:indexPath.row];
    NSLog(@"%@",ideaSelected);
    
    //Now we will switch to the idea view controller
    ARDAppIdeaViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ideaVC"];
    vc.ideaInfoMain = ideaSelected;
    //UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.navigationController pushViewController:vc animated:YES];
    // [vc release];
}

@end
