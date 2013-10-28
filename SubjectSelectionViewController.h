//
//  SubjectSelectionViewController.h
//  studentHelperApp
//
//  Created by cs321kw1a on 20/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Subjects.h"
#import "AddAssessmentViewController.h"
#import "AddClassViewController.h"

@interface SubjectSelectionViewController : UITableViewController

@property(retain, nonatomic)NSMutableArray *subjects;

@property bool isAssessment, isClass;

@end
