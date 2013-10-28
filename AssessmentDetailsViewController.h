//
//  AssessmentDetailsViewController.h
//  studentHelperApp
//
//  Created by Ryan Toohey on 27/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Assessments.h"
#import "Subjects.h"

@interface AssessmentDetailsViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *assView;
@property (weak, nonatomic) IBOutlet UILabel *weightView;
@property (weak, nonatomic) IBOutlet UILabel *subjectView;
@property (weak, nonatomic) IBOutlet UIButton *markButton;
@property (weak, nonatomic) IBOutlet UILabel *dueView;
@property (weak, nonatomic) IBOutlet UILabel *markView;

- (IBAction)markButtonPressed:(id)sender;

@property(retain, nonatomic)Assessments *thisAssessment;
@end
