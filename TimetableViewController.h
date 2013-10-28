//
//  TimetableViewController.h
//  studentHelperApp
//
//  Created by cs321kw1a on 4/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubjectSelectionViewController.h"
#import "Subjects.h"
#import "AddSubjectViewController.h"
#import "CurrentSession.h"

@interface TimetableViewController : UITableViewController<UIActionSheetDelegate, UIAlertViewDelegate>

@property bool isAssessment, isClass;
@property(retain, nonatomic)Subjects *subjectToAdd;
@property(retain, nonatomic)NSArray *classes;
@property NSMutableArray *todaysClasses, *classArray;
@property(retain, nonatomic)NSString *dayOfTheWeek;
- (IBAction)addButtonPressed:(id)sender;

@end
