//
//  TimetableViewController.m
//  studentHelperApp
//
//  Created by cs321kw1a on 4/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import "TimetableViewController.h"

@interface TimetableViewController ()

@end

@implementation TimetableViewController

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
//    [Subjects MR_truncateAll];
//    [Assessments MR_truncateAll];
//    [Classes MR_truncateAll];
    [self setUp];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self setUp];
}

-(void)setUp
{
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Chalkboard-background.jpg"]];
    self.tableView.backgroundView = background;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"EEEE"];
    self.dayOfTheWeek = [dateFormatter stringFromDate:[NSDate date]];
    
    NSArray *thisSession = [[NSArray alloc]init];
    thisSession = [CurrentSession MR_findAll];
    
    self.todaysClasses = [[NSMutableArray alloc]init];
    self.classes = [[NSArray alloc]init];
    
    if (thisSession.count > 0)
    {
        CurrentSession *cs = [thisSession objectAtIndex:0];
        NSString *session = cs.currSession;
        self.classes = [Classes MR_findAllSortedBy:@"time" ascending:YES];
        
        for(int i = 0; i < self.classes.count; i++)
        {
            Classes *thisClass = [self.classes objectAtIndex:i];
            if([thisClass.day isEqualToString:self.dayOfTheWeek]) {
                [self.todaysClasses addObject:thisClass];
            }
        }
        
        self.classArray = [[NSMutableArray alloc]init];
        for(int i = 0; i < self.todaysClasses.count; i++)
        {
            Classes *thisClass = [self.todaysClasses objectAtIndex:i];
            if([thisClass.session isEqualToString:session])
            {
                [self.classArray addObject:thisClass];
            }
        }
    }
    [self.tableView reloadData];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return @"Current Session";
    else
        return @"Today's Timetable";
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(section == 0)
        return 1;
    else
        return self.classArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *thisSession = [[NSArray alloc]init];
    thisSession = [CurrentSession MR_findAll];
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    cell.detailTextLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    
    if(indexPath.section == 1)
    {
        Classes *class = [self.classArray objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", class.subjectCode, class.type];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm"];
        NSString *time = [formatter stringFromDate:class.time];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ in room %@", time, class.room];
        
       
    }
    if(indexPath.section == 0)
    {
        if([thisSession count])
        {
            CurrentSession *session = [thisSession objectAtIndex:0];
            cell.textLabel.text = session.currSession;
        }
        else
        {
            cell.textLabel.text = @"No current session has been set";
            cell.detailTextLabel.text = @"Please set a session";

            UIAlertView *needSession;
            needSession = [[UIAlertView alloc]
                            initWithTitle:@"Error"
                            message:@"You need to set your current session"
                            delegate:self
                            cancelButtonTitle:nil
                            otherButtonTitles:@"OK", nil];
            
            [needSession setAlertViewStyle:UIAlertViewStyleDefault];
            [needSession show];
        }
    }
    
    return cell;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];

    if([title isEqualToString:@"OK"])
    {
        [self performSegueWithIdentifier:@"timetable_to_add_current_session_segue" sender:self];
    }
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
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
        [self performSegueWithIdentifier:@"timetable_to_subject_select_segue" sender:self];
    }
    else if([buttonTitle isEqualToString:@"Class"])
    {
        self.isClass = true;
        self.isAssessment = false;
        [self performSegueWithIdentifier:@"timetable_to_subject_select_segue" sender:self];
    }
    else if([buttonTitle isEqualToString:@"Subject"])
    {
        [self performSegueWithIdentifier:@"timetable_to_add_subject_segue" sender:self];
    }
    else if([buttonTitle isEqualToString:@"Current Session"])
    {
        [self performSegueWithIdentifier:@"timetable_to_add_current_session_segue" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"timetable_to_subject_select_segue"])
    {
        SubjectSelectionViewController *dest = segue.destinationViewController;
        dest.hidesBottomBarWhenPushed = YES;
        dest.isAssessment = self.isAssessment;
        dest.isClass = self.isClass;
    }
    else
    {
        AddSubjectViewController *dest = segue.destinationViewController;
        dest.hidesBottomBarWhenPushed = YES;
    }
}

- (IBAction)addButtonPressed:(id)sender
{
    [self createActionSheet];
}
@end
