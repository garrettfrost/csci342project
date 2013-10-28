//
//  AssessmentDetailsViewController.m
//  studentHelperApp
//
//  Created by Ryan Toohey on 27/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import "AssessmentDetailsViewController.h"

@interface AssessmentDetailsViewController ()

@end

@implementation AssessmentDetailsViewController

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
    self.thisAssessment = [[Assessments MR_findByAttribute:@"assID" withValue:self.thisAssessment.assID] objectAtIndex:0];
    
    self.markView.text = [NSString stringWithFormat:@"%@", self.thisAssessment.mark];
    self.assView.text = self.thisAssessment.name;
    self.subjectView.text = self.thisAssessment.subjectCode;
    self.weightView.text = [NSString stringWithFormat:@"%@", self.thisAssessment.weighting];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    NSString *stringFromDate = [formatter stringFromDate:self.thisAssessment.due];
    self.dueView.text = stringFromDate;
    
    if([self.thisAssessment.completed isEqual: @1]) {
        self.markView.text = [NSString stringWithFormat:@"%@", self.thisAssessment.mark];
        [self.markButton setTitle:@"Edit Mark" forState:UIControlStateNormal];
    }
    
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Chalkboard-background.jpg"]];
    
    self.weightView.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    self.subjectView.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    self.dueView.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    self.markView.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    self.assView.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)markButtonPressed:(id)sender {
    UIAlertView *markInput;
    markInput = [[UIAlertView alloc]
                     initWithTitle:@"Add Mark"
                     message:@"Enter a mark for the assessment"
                     delegate:self
                     cancelButtonTitle:@"Cancel"
                     otherButtonTitles:@"Add", nil];
    
    [markInput setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [[markInput textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeDecimalPad];
    [markInput show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UITextField *textfield;
    textfield.delegate = self;
    UIAlertView *errorAlert;
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Add"])
    {
        textfield = [alertView textFieldAtIndex: 0];
        if([textfield.text isEqualToString:@""]) {
            
            errorAlert = [[UIAlertView alloc]
                         initWithTitle:@"Error:"
                         message:@"Invalid value for mark"
                         delegate:self
                         cancelButtonTitle:nil
                         otherButtonTitles:@"OK", nil];
            
            [errorAlert setAlertViewStyle:UIAlertViewStyleDefault];
            
            [errorAlert show];
            
        }
        else if([textfield.text doubleValue] > [self.thisAssessment.weighting doubleValue]) {
            errorAlert = [[UIAlertView alloc]
                          initWithTitle:@"Error:"
                          message:@"Mark entered greater than weight of assignment"
                          delegate:self
                          cancelButtonTitle:nil
                          otherButtonTitles:@"OK"
                          , nil];
            
            [errorAlert setAlertViewStyle:UIAlertViewStyleDefault];
            
            [errorAlert show];
        }
        else {
            NSNumber *mark = [[NSNumber alloc] initWithDouble:[textfield.text doubleValue]];
            self.thisAssessment.mark = mark;
            self.thisAssessment.completed = @1;
            Subjects *subject = [[Subjects MR_findByAttribute:@"subjectCode" withValue:self.thisAssessment.subjectCode] objectAtIndex:0];
            
            double subMark = [subject.mark doubleValue];
            double thisMark = [mark doubleValue];
            subject.mark = [NSNumber numberWithDouble:subMark + thisMark];
            
            self.markView.text = [NSString stringWithFormat:@"%@", mark];
            [self.markButton setTitle:@"Edit Mark" forState:UIControlStateNormal];
            
            [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        }
    }
}
@end
