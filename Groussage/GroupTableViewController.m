//
//  GroupTableViewController.m
//  Groussage
//
//  Created by KT on 4/27/14.
//  Copyright (c) 2014 Groussage. All rights reserved.
//

#import "GroupTableViewController.h"
#import "GroupTableViewCell.h"
#import "GroupDetailViewController.h"
#import "GroupAdd.h"
#import "GroupAddViewController.h"

@interface GroupTableViewController ()



@end

@implementation GroupTableViewController

/* method to load initial data when loaded
-(void)loadInitialData{
    GroupAdd *item1 = [[GroupAdd alloc]init];
    item1.groupName = @"Kevin's Group";
    [self.groupList addObject:item1];
    
    GroupAdd *item2 = [[GroupAdd alloc]init];
    item2.groupName = @"Almas";
     [self.groupList addObject:item2];
}
*/

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    /* old
    _gName = @[@"Chevy",
                  @"BMW"];
    
    _gDesc = @[@"Volt",
                   @"Mini"];
    
    _gImage = @[@"chevy_volt.jpg",
                   @"mini_clubman.jpg"];
    */
    
    //initiatese array
    self.groupList = [[NSMutableArray alloc]init];
    
    //[self loadInitialData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    //old static array
    //return _gName.count;
    
    //returns the amount of rows in array for the table
    return [self.groupList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //which cell should be displayed by declaring cell in table view
    static NSString *Cellidentifier = @"groupTableCell";
    GroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cellidentifier forIndexPath:indexPath];
    
    
    GroupAdd *gItem = [self.groupList objectAtIndex:indexPath.row];
    cell.groupName.text = gItem.groupName;
    cell.groupDesc.text = gItem.groupDescription;
    cell.groupImage.image  = gItem.groupImage;
    
    // Configure the cell...
    
//    long row = [indexPath row];
//    cell.groupName.text = _gName[row];
//    cell.groupDesc.text = _gDesc[row];
//    cell.groupImage.image = [UIImage imageNamed:_gImage[row]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [_groupList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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




-(IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    //source of data from GroupAddViewController
    GroupAddViewController *source = [segue sourceViewController];
    GroupAdd *addedGroup = source.groupAddition;
    
    if (addedGroup != nil) {
        [self.groupList addObject:addedGroup];
        [self.tableView reloadData];
    }
}

#pragma mark - Navigation

//In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"ShowGroupDetails" ]) {
        
        
        // Get the new view controller using [segue destinationViewController].
        
        //GroupDetailViewController *detailViewController = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        long row = [myIndexPath row];
        
        NSObject *object = _groupList[row];
        //detailViewController.navigationItem.title = _gName[row];
        // Pass the selected object to the new view controller.
        
        
        
        
        //work from this area
        //add information to array to display towards GroupDetailViewController
        
       
        [[segue destinationViewController] setDetailItem: object];
        
        //detailViewController.groupDetailModel = @[self.groupList];
        
        //detailViewController.groupDetailModel = @[_gName[row], _gDesc[row], _gImage[row]];
    }
    
    
}

@end
