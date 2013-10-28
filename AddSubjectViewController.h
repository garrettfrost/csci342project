//
//  AddSubjectViewController.h
//  studentHelperApp
//
//  Created by cs321kw1a on 11/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD
#import "Subjects.h"
=======
#import "Subject.h"
>>>>>>> 6b506c976e0a13fb292fed003bada4e46250ded3
#import "CoreData+MagicalRecord.h"

@interface AddSubjectViewController : UIViewController<UITextFieldDelegate, UIPickerViewDelegate>

@property(retain, nonatomic)NSString *name;
@property(retain, nonatomic)NSString *subjectCode;
@property(retain, nonatomic)NSString *session;
@property int creditPoints;
@property float mark;
@property BOOL completed;
@property(retain, nonatomic)NSArray *sessionArray;

@property (weak, nonatomic) IBOutlet UIPickerView *sessionPicker;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButtonPressed;

@property (weak, nonatomic) IBOutlet UITextField *subjectNameField;
@property (weak, nonatomic) IBOutlet UITextField *subjectCodeField;
@property (weak, nonatomic) IBOutlet UITextField *creditPointsField;

<<<<<<< HEAD
@property (weak, nonatomic) IBOutlet UILabel *subjectNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subjectCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *creditPointsLabel;
@property (weak, nonatomic) IBOutlet UILabel *sessionLabel;
@property (retain, nonatomic) IBOutlet UIImageView *background;

@property (weak, nonatomic) Subjects *subjectToAdd;
=======
@property (weak, nonatomic) Subject *subjectToAdd;
>>>>>>> 6b506c976e0a13fb292fed003bada4e46250ded3

- (IBAction)doneButtonPressed:(id)sender;
@end
