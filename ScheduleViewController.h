//
//  ScheduleViewController.h
//  studentHelperApp
//
//  Created by cs321kw1a on 4/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubjectSelectionViewController.h"
#import "SubjectViewController.h"

@interface ScheduleViewController : UITableViewController<UIActionSheetDelegate>

@property bool isAssessment, isClass;
@property(retain, nonatomic)NSMutableArray *subjects;

- (IBAction)addButtonPressed:(id)sender;
@end
