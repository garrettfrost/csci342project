//
//  WAMViewController.h
//  studentHelperApp
//
//  Created by cs321kw1a on 4/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubjectSelectionViewController.h"
#import "Session.h"

@interface WAMViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UITableView *sessionsWAMTable;
@property (weak, nonatomic) NSArray *subjects;
@property bool isAssessment, isClass;
@property (weak, nonatomic) IBOutlet UILabel *WAMText;
@property (weak, nonatomic) IBOutlet UILabel *wamValueLabel;
@property (retain, nonatomic) Session *session;
@property (retain, nonatomic) NSMutableArray *sessionsArray;
-(double) calculateWAMWithSubjects : (NSArray *) subjects;
-(void) setUp;

- (IBAction)addButtonPressed:(id)sender;
@end
