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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(section == 0)
        return [self.incomplete count];
    else
        return [self.complete count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
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
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return @"Incomplete";
    else
        return @"Complete";
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
    [self performSegueWithIdentifier:@"view_assessment_segue" sender:self];
}

- (void)createActionSheet
{
    UIActionSheet *tripType;
    tripType = [[UIActionSheet alloc]init];
    
    NSString *actionSheetTitle = @"What would you like to add?"; //Action Sheet Title
    NSString *other1 = @"Subject";
    NSString *other2 = @"Assessment";
    NSString *other3 = @"Class";
    NSString *other4 = @"Current Session";
    NSString *cancel = @"Cancel";
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:actionSheetTitle
                                  delegate:self
                                  cancelButtonTitle:cancel
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:other1, other2, other3, other4, nil];
    
    [actionSheet showFromTabBar:self.tabBarController.tabBar];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
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
@end
