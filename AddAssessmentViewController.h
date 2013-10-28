//
//  AddAssessmentViewController.h
//  studentHelperApp
//
//  Created by cs321kw1a on 20/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Assessments.h"
#import "Classes.h"
#import "Subjects.h"

@interface AddAssessmentViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>

@property(retain, nonatomic)NSString *name;
@property(retain, nonatomic)NSDate *dueDate;
@property(retain, nonatomic)NSArray *assessments;
@property float mark, weighting;
@property (weak, nonatomic) IBOutlet UIDatePicker *dueDateSpinner;
@property (weak, nonatomic) IBOutlet UITextField *assessmentNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightingTextField;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightingLabel;
@property (weak, nonatomic) IBOutlet UILabel *duedateLabel;

@property(retain, nonatomic)Assessments *assessmentToAdd;
@property(retain, nonatomic)Subjects *thisSubject;

- (IBAction)doneButtonPressed:(id)sender;

@end
