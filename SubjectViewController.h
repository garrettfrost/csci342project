//
//  SubjectViewController.h
//  studentHelperApp
//
//  Created by cs321kw1a on 20/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Subjects.h"
#import "Classes.h"
#import "Assessments.h"

@interface SubjectViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *subjectTable;
@property (retain, nonatomic) NSMutableArray* assessments, *classes;

@property (retain, nonatomic) NSMutableArray* marksNeeded;
@property (retain, nonatomic) NSString* grade;
@property(retain, nonatomic)Subjects *thisSubject;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *markLabel;

@property double currMark;
-(void) calcGrades;

@end
