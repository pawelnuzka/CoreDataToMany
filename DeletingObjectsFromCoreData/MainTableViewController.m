//
//  MainTableViewController.m
//  DeletingObjectsFromCoreData
//
//  Created by Pawel Nuzka on 8/3/11.
//  Copyright 2011 PWR. All rights reserved.
//

#import "MainTableViewController.h"


@implementation MainTableViewController
@synthesize data, context, currentEntity, viewNumber;
- (NSArray *)fetchManagedObjectsForEntity:(NSString*)entityName withPredicate:(NSPredicate*)predicate
{
    if (!context) {
        NSLog(@"context sie schrzanil");
        return [NSArray array];
    }
	NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
	NSSortDescriptor *sortDescriptior = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDesscriptors = [[NSArray alloc] initWithObjects:sortDescriptior, nil];    
	NSFetchRequest	*request = [[NSFetchRequest alloc] init];
    
    [request setSortDescriptors:sortDesscriptors];
	request.entity = entity;
    request.predicate = predicate;
    NSArray	*results = [context executeFetchRequest:request error:nil];
	
    [request release];
	[sortDescriptior release];
    [sortDesscriptors release];
	return results;
}
- (void)loadData
{
    if (!viewNumber)
        viewNumber = [NSNumber numberWithInt:1];
    int number = [viewNumber intValue];
    switch (number) {
        case 1:
            [self setTitle:@"A"];
            data = [self fetchManagedObjectsForEntity:@"A" withPredicate:nil];
            break;
        case 2:
            data = [NSMutableArray arrayWithArray:[[[self currentEntity] b] allObjects]];
            [data addObjectsFromArray:[[[self currentEntity] c] allObjects]];
            break;
        case 3:
            if ([self.currentEntity isKindOfClass:[B class]])
            {
                data = [NSMutableArray arrayWithArray:[[[self currentEntity] a] allObjects]];
                [data addObjectsFromArray:[[[self currentEntity] c] allObjects]];
            }
            else
                data = [NSMutableArray arrayWithArray:[[[self currentEntity] d] allObjects]];
            break;
        case 4:
            data = [NSMutableArray arrayWithArray:[[[self currentEntity] e] allObjects]];
            break;
        default:
            break;
    }
    [data retain];
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text = [[self.data objectAtIndex:indexPath.row] name];
    // Configure the cell...
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.context deleteObject:[data objectAtIndex:indexPath.row]];
        [self.context save:nil];
        [self loadData];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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
 
    if ([viewNumber intValue] >= 4)
        return;
    // Navigation logic may go here. Create and push another view controller.
    
    MainTableViewController *detailViewController = [[MainTableViewController alloc] initWithNibName:@"MainTableViewController" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    NSManagedObject *entity = [self.data objectAtIndex:indexPath.row];
    if ([entity isKindOfClass:[A class]] && [viewNumber intValue] != 1)
         detailViewController.viewNumber = [NSNumber numberWithInt:2];
    else if ([entity isKindOfClass:[C class]] || [entity isKindOfClass:[B class]])
        detailViewController.viewNumber = [NSNumber numberWithInt:3]; 
    else if ([entity isKindOfClass:[D class]])
        detailViewController.viewNumber = [NSNumber numberWithInt:4];
    else if ([entity isKindOfClass:[E class]])
        detailViewController.viewNumber = [NSNumber numberWithInt:5];
    else
        detailViewController.viewNumber = [NSNumber numberWithInt:[viewNumber intValue] +1];

    detailViewController.context = self.context;
        detailViewController.currentEntity = entity;
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
     
}

@end
