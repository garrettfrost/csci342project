//
//  AddClassViewController.m
//  studentHelperApp
//
//  Created by cs321kw1a on 20/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import "AddClassViewController.h"

@interface AddClassViewController ()

@end

@implementation AddClassViewController

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
    self.roomNumberTextField.delegate = self;
    
    NSString *str = @"00:00";
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm"];
    self.startTimePicker.date = [formatter dateFromString:str];
    
    self.classDay.selectedSegmentIndex = 0;
    self.classType.selectedSegmentIndex = 0;
    self.classLength.selectedSegmentIndex = 0;
    
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Chalkboard-background.jpg"]];
    
    self.roomnumberLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:19.0];
    
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    if([textField tag] == 0)
    {
        self.room = [textField text];
    }
    
    return YES;
}

- (IBAction)chosenLength:(id)sender
{
    if(self.classLength.selectedSegmentIndex == 0)
        self.classL = 1;
    else if(self.classLength.selectedSegmentIndex == 1)
        self.classL = 2;
    else
        self.classL = 3;
}

- (IBAction)chosenType:(id)sender
{
    if(self.classType.selectedSegmentIndex == 0)
        self.classT = @"Lecture";
    else if(self.classType.selectedSegmentIndex == 1)
        self.classT = @"Seminar";
    else if(self.classType.selectedSegmentIndex == 2)
        self.classT = @"Lab";
    else
        self.classT = @"Tut";
}

- (IBAction)chosenDay:(id)sender
{
    if(self.classDay.selectedSegmentIndex == 0)
        self.classD = @"Monday";
    else if(self.classDay.selectedSegmentIndex == 1)
        self.classD = @"Tuesday";
    else if(self.classDay.selectedSegmentIndex == 2)
        self.classD = @"Wednesday";
    else if(self.classDay.selectedSegmentIndex == 3)
        self.classD = @"Thursday";
    else
        self.classD = @"Friday";
}

- (IBAction)hasSelectedTime:(id)sender
{
    self.startTime = self.startTimePicker.date;
}

- (IBAction)doneButtonPressed:(id)sender
{   
    if(!self.room)
    {
        UIAlertView *noRoom;
        noRoom = [[UIAlertView alloc]
                     initWithTitle:@"Error"
                     message:@"You need a room number for a class"
                     delegate:self
                     cancelButtonTitle:nil
                     otherButtonTitles:@"OK", nil];
        
        [noRoom setAlertViewStyle:UIAlertViewStyleDefault];
        [noRoom show];
    }
    else
    {
        self.classToAdd = [Classes MR_createEntity];
        
        NSNumber *length = [NSNumber numberWithInt:self.classL];
        self.classToAdd.duration = length;
        
        self.classToAdd.day = self.classD;
        self.classToAdd.type = self.classT;
        if(self.startTime)  
            self.classToAdd.time = self.startTime;
        else
        {
            self.startTime = self.startTimePicker.date;
            self.classToAdd.time = self.startTime;
        }
        
        self.classToAdd.subjectCode = self.thisSubject.subjectCode;
        self.classToAdd.room = self.roomNumberTextField.text;
        self.classToAdd.session = self.thisSubject.session;

        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}
@end
