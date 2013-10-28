//
//  AddAssessmentViewController.m
//  studentHelperApp
//
//  Created by cs321kw1a on 20/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import "AddAssessmentViewController.h"

@interface AddAssessmentViewController ()

@end

@implementation AddAssessmentViewController

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
    
    self.assessmentNameTextField.delegate = self;
    self.weightingTextField.delegate = self;
    self.assessments = [Assessments MR_findAll];
    
    NSString *str = @"00:00";
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm"];
    self.dueDateSpinner.date = [formatter dateFromString:str];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:@"UITextFieldTextDidChangeNotification" object:self.weightingTextField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:@"UITextFieldTextDidChangeNotification" object:self.assessmentNameTextField];
    
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Chalkboard-background.jpg"]];
    
    self.nameLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    self.weightingLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    self.duedateLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButtonPressed:(id)sender
{
    if(!self.name || !self.weighting)
    {
        UIAlertView *nameOrWeight;
        nameOrWeight = [[UIAlertView alloc]
                  initWithTitle:@"Error"
                  message:@"You need both a name and a weight for an assessment"
                  delegate:self
                  cancelButtonTitle:nil
                  otherButtonTitles:@"OK", nil];
        
        [nameOrWeight setAlertViewStyle:UIAlertViewStyleDefault];
        [nameOrWeight show];
    }
    else
    {
        self.assessmentToAdd = [Assessments MR_createEntity];
        self.assessmentToAdd.assID = [NSNumber numberWithInt:[self.assessments count] + 1 ];
        self.assessmentToAdd.subjectCode = self.thisSubject.subjectCode;
        self.assessmentToAdd.name = self.assessmentNameTextField.text;
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        self.assessmentToAdd.weighting = [f numberFromString:self.weightingTextField.text];
        self.assessmentToAdd.due = self.dueDateSpinner.date;

        self.assessmentToAdd.completed = @0;
        
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
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
        self.weighting = [[(UITextField*)notif.object text] floatValue];
    }
}

@end
