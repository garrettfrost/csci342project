//
//  AddClassViewController.h
//  studentHelperApp
//
//  Created by cs321kw1a on 20/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Classes.h"
#import "Subjects.h"

@interface AddClassViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *classLength;
@property (weak, nonatomic) IBOutlet UISegmentedControl *classType;
@property (weak, nonatomic) IBOutlet UISegmentedControl *classDay;

@property(weak, nonatomic) IBOutlet UITextField *roomNumberTextField;
@property(weak, nonatomic) IBOutlet UIDatePicker *startTimePicker;
@property(retain, nonatomic)NSString *room, *classT, *classD;
@property(retain, nonatomic)NSDate *startTime;
@property (weak, nonatomic) IBOutlet UILabel *roomnumberLabel;
@property int classL;

@property(retain, nonatomic)Subjects *thisSubject;
@property(retain, nonatomic)Classes *classToAdd;

- (IBAction)chosenLength:(id)sender;
- (IBAction)chosenType:(id)sender;
- (IBAction)chosenDay:(id)sender;
- (IBAction)hasSelectedTime:(id)sender;

- (IBAction)doneButtonPressed:(id)sender;

@end
