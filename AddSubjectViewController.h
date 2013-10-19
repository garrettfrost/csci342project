//
//  AddSubjectViewController.h
//  studentHelperApp
//
//  Created by cs321kw1a on 11/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Subject.h"
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

@property (weak, nonatomic) Subject *subjectToAdd;

- (IBAction)doneButtonPressed:(id)sender;
@end
