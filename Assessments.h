//
//  Assessments.h
//  studentHelperApp
//
//  Created by cs321kw1a on 21/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Subjects;

@interface Assessments : NSManagedObject

@property (nonatomic, retain) NSNumber * assID;
@property (nonatomic, retain) NSDate * due;
@property (nonatomic, retain) NSNumber * mark;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * weighting;
@property (nonatomic, retain) NSString * subjectCode;
@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) Subjects *assOwnedBySubject;

@end
