//
//  TimetableViewController.h
//  studentHelperApp
//
//  Created by cs321kw1a on 4/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD
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
=======
#import "AddSubjectViewController.h"

@interface TimetableViewController : UITableViewController<UIActionSheetDelegate>

>>>>>>> 6b506c976e0a13fb292fed003bada4e46250ded3
- (IBAction)addButtonPressed:(id)sender;

@end
