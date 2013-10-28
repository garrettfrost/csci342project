//
//  AssessmentsViewController.m
//  studentHelperApp
//
//  Created by cs321kw1a on 4/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import "AssessmentsViewController.h"

@interface AssessmentsViewController ()

@end

@implementation AssessmentsViewController

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
    
<<<<<<< HEAD
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Chalkboard-background.jpg"]];
    self.tableView.backgroundView = background;
    
    self.assessments = [NSMutableArray arrayWithArray:[Assessments MR_findAllSortedBy:@"due" ascending:YES]];
    
    self.complete = [[NSMutableArray alloc]init];
    self.incomplete = [[NSMutableArray alloc]init];
    
    for(int i = 0; i < self.assessments.count; i++)
    {
        Assessments *assess = [self.assessments objectAtIndex:i];
        if([assess.completed isEqual:@1])
            [self.complete addObject:assess];
        else
            [self.incomplete addObject:assess];
    }
=======
>>>>>>> 6b506c976e0a13fb292fed003bada4e46250ded3
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

<<<<<<< HEAD
-(void)viewDidAppear:(BOOL)animated
{
    self.complete = [[NSMutableArray alloc]init];
    self.incomplete = [[NSMutableArray alloc]init];
    
    for(int i = 0; i < self.assessments.count; i++)
    {
        Assessments *assess = [self.assessments objectAtIndex:i];
        if([assess.completed isEqual:@1])
            [self.complete addObject:assess];
        else
            [self.incomplete addObject:assess];
    }
    [self.tableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.assessments = [NSMutableArray arrayWithArray:[Assessments MR_findAllSortedBy:@"due" ascending:YES]];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
=======
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
>>>>>>> 6b506c976e0a13fb292fed003bada4e46250ded3
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
<<<<<<< HEAD
    // Return the number of rows in the section.
    if(section == 0)
        return [self.incomplete count];
    else
        return [self.complete count];
=======
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
>>>>>>> 6b506c976e0a13fb292fed003bada4e46250ded3
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
<<<<<<< HEAD
    static NSString *CellIdentifier = @"assessment";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    cell.detailTextLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    
    if(indexPath.section == 0)
    {
        Assessments *assess = [self.incomplete objectAtIndex:indexPath.row];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd-MM-yyyy hh:mm"];
        NSString *date = @"Due date: ";
        cell.detailTextLabel.text = [date stringByAppendingString:[formatter stringFromDate:assess.due]];
        
        NSString *main = [assess.name stringByAppendingString:@" - "];
        cell.textLabel.text = [main stringByAppendingString:assess.subjectCode];
    }
    else
    {
        Assessments *assess = [self.complete objectAtIndex:indexPath.row];
        cell.textLabel.text = assess.name;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Mark: %@/%@", assess.mark, assess.weighting];
    }
=======
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
>>>>>>> 6b506c976e0a13fb292fed003bada4e46250ded3
    
    return cell;
}

<<<<<<< HEAD
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return @"Incomplete";
    else
        return @"Complete";
}

=======
>>>>>>> 6b506c976e0a13fb292fed003bada4e46250ded3
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
<<<<<<< HEAD
    [self performSegueWithIdentifier:@"view_assessment_segue" sender:self];
=======
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
>>>>>>> 6b506c976e0a13fb292fed003bada4e46250ded3
}

- (void)createActionSheet
{
    UIActionSheet *tripType;
    tripType = [[UIActionSheet alloc]init];
    
    NSString *actionSheetTitle = @"What would you like to add?"; //Action Sheet Title
    NSString *other1 = @"Subject";
    NSString *other2 = @"Assessment";
    NSString *other3 = @"Class";
<<<<<<< HEAD
    NSString *other4 = @"Current Session";
=======
>>>>>>> 6b506c976e0a13fb292fed003bada4e46250ded3
    NSString *cancel = @"Cancel";
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:actionSheetTitle
                                  delegate:self
                                  cancelButtonTitle:cancel
                                  destructiveButtonTitle:nil
<<<<<<< HEAD
                                  otherButtonTitles:other1, other2, other3, other4, nil];
=======
                                  otherButtonTitles:other1, other2, other3, nil];
>>>>>>> 6b506c976e0a13fb292fed003bada4e46250ded3
    
    [actionSheet showFromTabBar:self.tabBarController.tabBar];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
<<<<<<< HEAD
    if ([buttonTitle isEqualToString:@"Assessment"])
    {
        self.isAssessment = true;
        self.isClass = false;
        [self performSegueWithIdentifier:@"assessments_to_subject_select_segue" sender:self];
    }
    else if([buttonTitle isEqualToString:@"Class"])
    {
        self.isClass = true;
        self.isAssessment = false;
        [self performSegueWithIdentifier:@"assessments_to_subject_select_segue" sender:self];
    }
    else if([buttonTitle isEqualToString:@"Subject"])
    {
        [self performSegueWithIdentifier:@"assessments_to_add_subject_segue" sender:self];
    }
    else if([buttonTitle isEqualToString:@"Current Session"])
    {
        [self performSegueWithIdentifier:@"assessments_to_add_current_session_segue" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"assessments_to_subject_select_segue"])
    {
        SubjectSelectionViewController *dest = segue.destinationViewController;
        dest.hidesBottomBarWhenPushed = YES;
        dest.isAssessment = self.isAssessment;
        dest.isClass = self.isClass;
    }
    else if([segue.identifier isEqualToString:@"view_assessment_segue"])
    {
        
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        
        if(path.section == 0)
        {
            AssessmentDetailsViewController *dest = segue.destinationViewController;
            dest.hidesBottomBarWhenPushed = YES;
            dest.thisAssessment = [self.incomplete objectAtIndex:path.row];
        }
        else
        {
            AssessmentDetailsViewController *dest = segue.destinationViewController;
            dest.hidesBottomBarWhenPushed = YES;
            dest.thisAssessment = [self.complete objectAtIndex:path.row];
        }
    }
}

- (IBAction)addButtonPressed:(id)sender
{
    [self createActionSheet];
}
=======
    if ([buttonTitle isEqualToString:@"Subject"])
    {
        [self performSegueWithIdentifier:@"assessment_to_add_subject" sender:self];
    }
    else if ([buttonTitle isEqualToString:@"Assessment"])
    {
        [self performSegueWithIdentifier:@"assessment_to_add_assessment" sender:self];
    }
    else if([buttonTitle isEqualToString:@"Class"])
    {
        [self performSegueWithIdentifier:@"assessment_to_add_class" sender:self];
    }
}

>>>>>>> 6b506c976e0a13fb292fed003bada4e46250ded3
@end
