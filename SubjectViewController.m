//
//  SubjectViewController.m
//  studentHelperApp
//
//  Created by cs321kw1a on 20/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import "SubjectViewController.h"
#import "Assessments.h"

@interface SubjectViewController ()

@end

@implementation SubjectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    self.assessments = [NSMutableArray arrayWithArray:[Assessments MR_findByAttribute:@"subjectCode" withValue:self.thisSubject.subjectCode]];
    self.classes = [NSMutableArray arrayWithArray:[Classes MR_findByAttribute:@"subjectCode" withValue:self.thisSubject.subjectCode]];
    
    self.nameLabel.text = self.thisSubject.name;
    self.codeLabel.text = self.thisSubject.subjectCode;
    
    if (self.assessments.count > 0 && self.classes.count > 0) {
        self.subjectTable.delegate = self;
        self.subjectTable.dataSource = self;
        
        [self calcGrades];
        
        self.gradeLabel.text = self.grade;
        self.markLabel.text = [NSString stringWithFormat:@"%0.2f%%", self.currMark];
    }
    
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Chalkboard-background.jpg"]];
    
    self.nameLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    self.gradeLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    self.markLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    self.codeLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];

    
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return [self.assessments count];
    else if(section == 1)
        return [self.classes count];
    else
        return [self.marksNeeded count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"subjectCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    
    if(indexPath.section == 0)
    {
        Assessments *assess = [self.assessments objectAtIndex:indexPath.row];
        cell.textLabel.text = assess.name;
        if([assess.completed isEqual:@0])
        {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"dd-MM-yyyy hh:mm"];
            NSString *date = @"Due: ";
            cell.detailTextLabel.text = [date stringByAppendingString:[formatter stringFromDate:assess.due]];
        }
        else
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Mark: %@/%@", assess.mark, assess.weighting];
    }
    else if(indexPath.section == 1)
    {
        Classes *class = [self.classes objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", class.day, class.type];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm"];
        NSString *time = [formatter stringFromDate:class.time];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ in room %@", time, class.room];
    }
    else
    {
        cell.textLabel.text = [self.marksNeeded objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = @"";
    }
    
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return @"Assessments";
    if(section == 1)
        return @"Classes";
    else
        return @"Marks Needed";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) calcGrades
{
    int totalWeight = 0;
    double totalMark = 0;
    self.currMark = 0;
    self.grade = [[NSString alloc] init];
    int weightLeft = 0;
    self.marksNeeded = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < self.assessments.count; i++)
    {
        Assessments *ass = [self.assessments objectAtIndex:i];
        if([ass.completed isEqual:@1])
        {
            totalWeight += [ass.weighting integerValue];
            totalMark += [ass.mark doubleValue];
        }
    }
    
    self.currMark = (totalMark/totalWeight) * 100;
    
    if(self.currMark < 50)
    {
        self.grade = @"F";
    }
    else if(self.currMark >= 50 && self.currMark < 65)
    {
        self.grade = @"P";
    }
    else if(self.currMark >= 65 && self.currMark < 75)
    {
        self.grade = @"C";
    }
    else if(self.currMark >= 75 && self.currMark < 85)
    {
        self.grade = @"D";
    }
    else if(self.currMark >= 85)
    {
        self.grade = @"HD";
    }
    
    weightLeft = 100 - totalWeight;
    
    if (weightLeft > 0) {
        if (85 < weightLeft + totalMark)
        {
            NSString *markNeededString = [NSString stringWithFormat:@"Need %0.1f/%d to get a HD", 85 - totalMark, weightLeft];
            [self.marksNeeded addObject:markNeededString];
        }
        else
        {
            NSString *markNeededString = @"Unable to get a HD in this subject";
            [self.marksNeeded addObject:markNeededString];
        }
        
        if (75 < weightLeft + totalMark)
        {
            NSString *markNeededString = [NSString stringWithFormat:@"Need %0.1f/%d to get a D", 75 - totalMark, weightLeft];
            [self.marksNeeded addObject:markNeededString];
        }
        else
        {
            NSString *markNeededString = @"Unable to get a D in this subject";
            [self.marksNeeded addObject:markNeededString];
        }
        
        if (65 < weightLeft + totalMark)
        {
            NSString *markNeededString = [NSString stringWithFormat:@"Need %0.1f/%d to get a C", 65 - totalMark, weightLeft];
            [self.marksNeeded addObject:markNeededString];
        }
        else
        {
            NSString *markNeededString = @"Unable to get a C in this subject";
            [self.marksNeeded addObject:markNeededString];
        }
        
        if (50 < weightLeft + totalMark)
        {
            NSString *markNeededString = [NSString stringWithFormat:@"Need %0.1f/%d to get a P", 50 - totalMark, weightLeft];
            [self.marksNeeded addObject:markNeededString];
        }
        else
        {
            NSString *markNeededString = @"Unable to get a P in this subject";
            [self.marksNeeded addObject:markNeededString];
        }

    }
}

@end
