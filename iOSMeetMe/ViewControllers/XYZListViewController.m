//
//  XYZListViewController.m
//  iOSMeetMe
//
//  Created by Damien Soulard on 28/11/2013.
//  Copyright (c) 2013 Damien Soulard. All rights reserved.
//

#import "XYZListViewController.h"
#import "XYZAddViewController.h"
#import "XYZEditViewController.h"
#import "XYZAppointment.h"
#import "Appointment.h"

@interface XYZListViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;

@property NSMutableArray *apptList;

@end

@implementation XYZListViewController

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    [self fetchAppt];
    [self.tableView reloadData];
}

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
    [self fetchAppt];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)fetchAppt
{
    self.apptList = [NSMutableArray arrayWithArray:[Appointment findAllSortedBy:@"date" ascending:YES]];
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
    return [self.apptList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Appointment *appt = [self.apptList objectAtIndex:indexPath.row];
    cell.textLabel.text = appt.title;
    cell.detailTextLabel.text = [self dateToString:appt.startTime withDateStyle:NSDateFormatterNoStyle andTimeStyle:NSDateFormatterShortStyle];
    
    return cell;
}

- (NSString *)dateToString:(NSDate *)date withDateStyle:(NSDateFormatterStyle)dateStyle andTimeStyle:(NSDateFormatterStyle)timeStyle
{
    return [NSDateFormatter localizedStringFromDate:date
                                          dateStyle:dateStyle
                                          timeStyle:timeStyle];
}


- (IBAction)toggleEditMode:(id)sender
{
    if ([self.tableView isEditing]) {
        [self.tableView setEditing:NO animated:YES];
        [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc]
                                                   initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                   target:self
                                                   action:@selector(toggleEditMode:)] animated:YES];
        self.navigationItem.rightBarButtonItem = self.addButton;
    } else {
        [self.tableView setEditing:YES animated:YES];
        [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc]
                                                   initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                   target:self
                                                   action:@selector(toggleEditMode:)] animated:YES];
        self.navigationItem.rightBarButtonItem = nil;
    }
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
        Appointment *appt = [self.apptList objectAtIndex:indexPath.row];
        [self.apptList removeObjectAtIndex:indexPath.row];
        [appt deleteEntity];
        [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editApptView"]) {
        XYZEditViewController *editViewController = segue.destinationViewController;
        editViewController.appt =
                            [self.apptList objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
}

@end
