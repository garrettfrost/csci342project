//
//  WAMViewController.m
//  studentHelperApp
//
//  Created by cs321kw1a on 4/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import "WAMViewController.h"
#import "Subjects.h"

@interface WAMViewController ()

@end

@implementation WAMViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Chalkboard-background.jpg"]];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    
    self.WAMText.font = [UIFont fontWithName:@"DK Crayon Crumble" size:50.0];
    self.wamValueLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:50.0];
    
    [self setUp];
}

- (void)setUp {
    self.sessionsWAMTable.delegate = self;
    self.sessionsWAMTable.dataSource = self;
    NSMutableDictionary *sessions = [[NSMutableDictionary alloc] init];
    // Get all subjects
    self.subjects = [Subjects MR_findAll];
    
    // Get all subjects for each session
    for (int i = 0; i < self.subjects.count; i++) {
        Subjects *s = [self.subjects objectAtIndex:i];
        if([sessions objectForKey:s.session])
        {
            NSMutableArray *sessionSubjects = [sessions objectForKey:s.session];
            [sessionSubjects addObject:s];
        }
        else {
            NSMutableArray *sessionSubjects = [[NSMutableArray alloc]init];
            [sessionSubjects addObject:s];
            [sessions setObject:sessionSubjects forKey:s.session];
        }
    }
    
    NSArray *keys = [sessions allKeys];
    self.sessionsArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < keys.count; i++) {
        NSString *key = [keys objectAtIndex:i];
        double WAM = [self calculateWAMWithSubjects:[sessions objectForKey:key]];
        Session *sesh = [[Session alloc] init];
        sesh.WAM = WAM;
        sesh.sessionName = [keys objectAtIndex:i];
        [self.sessionsArray addObject:sesh];
    }
    
    
    // Calculate overall WAM
    double overallWAM = [self calculateWAMWithSubjects:self.subjects];
    
    self.WAMText.text = [NSString stringWithFormat:@"%0.1f", overallWAM];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [self setUp];
    [self.sessionsWAMTable reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.sessionsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"wamCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    cell.detailTextLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    
    Session *s = [self.sessionsArray objectAtIndex:indexPath.row];
    
    // Configure the cell...
    cell.textLabel.text = s.sessionName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%0.1f", s.WAM];
    
    return cell;
}

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

-(double) calculateWAMWithSubjects:(NSArray *)subjects {
    double total = 0;
    double WAM = 0;
    int totalCPs = 0;
    
    // Add up the total subject marks times credit points and total credit points
    for(int i = 0; i < subjects.count; i++) {
        total += [((Subjects*)[subjects objectAtIndex:i]).mark doubleValue] * [((Subjects*)[subjects objectAtIndex:i]).creditPoints doubleValue];
        totalCPs += [((Subjects*)[subjects objectAtIndex:i]).creditPoints integerValue];
    }
    
    WAM = total / totalCPs;
    
    return WAM;
}

- (IBAction)addButtonPressed:(id)sender
{
    [self createActionSheet];
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
        [self performSegueWithIdentifier:@"wam_to_subject_select_segue" sender:self];
    }
    else if([buttonTitle isEqualToString:@"Class"])
    {
        self.isClass = true;
        self.isAssessment = false;
        [self performSegueWithIdentifier:@"wam_to_subject_select_segue" sender:self];
    }
    else if([buttonTitle isEqualToString:@"Subject"])
    {
        [self performSegueWithIdentifier:@"WAM_to_add_subject_segue" sender:self];
    }
    else if([buttonTitle isEqualToString:@"Current Session"])
    {
        [self performSegueWithIdentifier:@"WAM_to_add_current_session_segue" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"wam_to_subject_select_segue"])
    {
        SubjectSelectionViewController *dest = segue.destinationViewController;
        dest.hidesBottomBarWhenPushed = YES;
        dest.isAssessment = self.isAssessment;
        dest.isClass = self.isClass;
    }
}

@end
