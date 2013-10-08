//
//  WAMViewController.h
//  studentHelperApp
//
//  Created by cs321kw1a on 4/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WAMViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *sessionsWAMTable;
@property (weak, nonatomic) NSArray *subjects;

-(double) calculateWAMWithSubjects : (NSArray *) subjects;

@end
