//
//  WAMViewController.m
//  studentHelperApp
//
//  Created by cs321kw1a on 4/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import "WAMViewController.h"
#import "Subject.h"

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
        
    self.sessionsWAMTable.delegate = self;
    self.sessionsWAMTable.dataSource = self;
    
    // Get all subjects
    
    // Get all subjects for each session
    
    // Calculate overall WAM
    //double overallWAM = [calculateWAMWithSubjects self.subjects];
    /*
    NSArray *sessionWAMs = [[NSArray alloc] init];
    int sessions =
    for (int i = 0; i < sessions; i++) {
        [sessionWAMs addObject[calculateWAMWithSubjects sessionSubjects]];
    }*/
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"wamCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = @"test";
    
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
        total += [((Subject*)[subjects objectAtIndex:i]).mark doubleValue] * [((Subject*)[subjects objectAtIndex:i]).creditPoints doubleValue];
        totalCPs += [((Subject*)[subjects objectAtIndex:i]).creditPoints integerValue];
    }
    
    WAM = total / totalCPs;
    
    return WAM;
}

@end
