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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:@"UITextFieldTextDidChangeNotification" object:self.subjectNameField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:@"UITextFieldTextDidChangeNotification" object:self.subjectCodeField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:@"UITextFieldTextDidChangeNotification" object:self.creditPointsField];
    
    self.subjectNameLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    self.subjectCodeLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    self.creditPointsLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    self.sessionLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];

    self.background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Chalkboard-background.jpg"]];
    [self.view addSubview:self.background];
    [self.view sendSubviewToBack:self.background];
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
    
    if([textField tag] == 0)
    {
        self.name = [textField text];
    }
    else if([textField tag] == 1)
    {
        self.subjectCode = [textField text];
    }
    else if([textField tag] == 2)
    {
        self.creditPoints = [textField.text integerValue];
    }

        
    return YES;
}

- (void)textFieldDidChange:(NSNotification *)notif
{
    if([(UITextField*)notif.object tag] == 0)
    {
        self.name = [(UITextField*)notif.object text];
    }
    else if([(UITextField*)notif.object tag] == 1)
    {
        self.subjectCode = [(UITextField*)notif.object text];
    }
    else if([(UITextField*)notif.object tag] == 2)
    {
        self.creditPoints = [[(UITextField*)notif.object text] integerValue];
    }
}
- (IBAction)doneButtonPressed:(id)sender
{
    if(!self.name || !self.subjectCode || !self.creditPoints || !self.sessionArray)
    {
        UIAlertView *error;
        error = [[UIAlertView alloc]
                        initWithTitle:@"Error"
                        message:@"You need a name, code and credit point amount for a subject"
                        delegate:self
                        cancelButtonTitle:nil
                        otherButtonTitles:@"OK", nil];
        
        [error setAlertViewStyle:UIAlertViewStyleDefault];
        [error show];
    }
    else
    {
        self.subjectToAdd = [Subjects MR_createEntity];
        
        self.subjectToAdd.name = self.name;
        self.subjectToAdd.subjectCode = self.subjectCode;
        self.subjectToAdd.session = self.session;
        self.subjectToAdd.creditPoints = [NSNumber numberWithInt:self.creditPoints];
        self.subjectToAdd.mark = 0;
        self.subjectToAdd.completed = FALSE;
        
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}
@end
