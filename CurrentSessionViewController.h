//
//  CurrentSessionViewController.h
//  studentHelperApp
//
//  Created by Ryan Toohey on 27/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrentSession.h"

@interface CurrentSessionViewController : UIViewController <UIPickerViewDelegate>

@property(retain, nonatomic)NSArray *sessionArray;
@property (weak, nonatomic) IBOutlet UIPickerView *sessionPicker;
@property (weak, nonatomic) CurrentSession *currentSeshToAdd;
@property (retain, nonatomic) NSString *session, *dayOfTheWeek;
@property (weak, nonatomic) IBOutlet UILabel *currentSessionLabel;
- (IBAction)doneButtonPressed:(id)sender;



@end
