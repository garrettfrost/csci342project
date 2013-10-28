//
//  CurrentSessionViewController.m
//  studentHelperApp
//
//  Created by Ryan Toohey on 27/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import "CurrentSessionViewController.h"

@interface CurrentSessionViewController ()

@end

@implementation CurrentSessionViewController

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
    
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Chalkboard-background.jpg"]];
    
    self.currentSessionLabel.font = [UIFont fontWithName:@"DK Crayon Crumble" size:30.0];
    
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];

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

- (IBAction)doneButtonPressed:(id)sender
{
    if(!self.session)
    {
        UIAlertView *error;
        error = [[UIAlertView alloc]
                 initWithTitle:@"Error"
                 message:@"You need to pick the current session"
                 delegate:self
                 cancelButtonTitle:nil
                 otherButtonTitles:@"OK", nil];
        
        [error setAlertViewStyle:UIAlertViewStyleDefault];
        [error show];
    }
    else
    {
        [CurrentSession MR_truncateAll];
        self.currentSeshToAdd = [CurrentSession MR_createEntity];
        
        self.currentSeshToAdd.currSession = self.session;
        
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}
@end
