//
//  AddSubjectViewController.m
//  studentHelperApp
//
//  Created by cs321kw1a on 11/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import "AddSubjectViewController.h"

@interface AddSubjectViewController ()

@end

@implementation AddSubjectViewController

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
    
    self.sessionPicker.delegate = self;
    self.sessionArray = [[NSArray alloc] initWithObjects:@"Autumn 2006", @"Spring 2006",@"Autumn 2007", @"Spring 2007",@"Autumn 2008", @"Spring 2008",@"Autumn 2009", @"Spring 2009",@"Autumn 2010", @"Spring 2010",@"Autumn 2011", @"Spring 2011",@"Autumn 2012", @"Spring 2012",@"Autumn 2013", @"Spring 2013",@"Autumn 2014", @"Spring 2014",@"Autumn 2014", @"Spring 2015",@"Autumn 2015", @"Spring 2015",@"Autumn 2016", @"Spring 2016",@"Autumn 2017", @"Spring 2017",@"Autumn 2018", @"Spring 2018",@"Autumn 2019", @"Spring 2019", nil];
    
    self.subjectNameField.delegate = self;
    self.subjectCodeField.delegate = self;
    self.creditPointsField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.sessionArray.count;
}

#pragma mark - UIPickerView Delegate
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40.0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.sessionArray objectAtIndex:row];
}

//If the user chooses from the pickerview, it calls this function;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //Let's print in the console what the user had chosen;
    self.session = [self.sessionArray objectAtIndex:row];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
//    [self.subjectCodeField resignFirstResponder];
//    [self.creditPointsField resignFirstResponder];

    return YES;
}

- (IBAction)doneButtonPressed:(id)sender
{
    self.subjectToAdd = [Subject MR_createEntity];
    
    self.subjectToAdd.name = self.subjectNameField.text;
    self.subjectToAdd.subjectCode = self.subjectCodeField.text;
    self.subjectToAdd.session = self.session;
    self.subjectToAdd.creditPoints = numberFromString(self.creditPointsField.text);
    self.subjectToAdd.mark = 0;
    self.subjectToAdd.completed = FALSE;
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
