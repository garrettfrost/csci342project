//
//  SubjectSelectionViewController.m
//  studentHelperApp
//
//  Created by cs321kw1a on 20/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import "SubjectSelectionViewController.h"

@interface SubjectSelectionViewController ()

@end

@implementation SubjectSelectionViewController

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
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.subjects = [NSMutableArray arrayWithArray:[Subjects MR_findAllSortedBy:@"name" ascending:YES]];
    
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Chalkboard-background.jpg"]];
    self.tableView.backgroundView = background;

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
    return self.subjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Class";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    cell.detailTextLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    
    // Configure the cell...
    Subjects *subject = [self.subjects objectAtIndex:indexPath.row];
    
    cell.textLabel.text = subject.name;
    cell.detailTextLabel.text = subject.subjectCode;
    
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
    if(self.isAssessment == true)
    {
        [self performSegueWithIdentifier:@"subject_select_to_assessment_segue" sender:self];
    }
    else
    {
        [self performSegueWithIdentifier:@"subject_select_to_class_segue" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"subject_select_to_assessment_segue"])
    {
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        AddAssessmentViewController *dest = segue.destinationViewController;
        dest.thisSubject = [self.subjects objectAtIndex:path.row];
    }
    else
    {
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        AddClassViewController *dest = segue.destinationViewController;
        dest.thisSubject = [self.subjects objectAtIndex:path.row];
    }
}

@end
