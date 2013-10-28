//
//  Subjects.h
//  studentHelperApp
//
//  Created by cs321kw1a on 20/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Assessments, Classes;

@interface Subjects : NSManagedObject

@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSNumber * creditPoints;
@property (nonatomic, retain) NSNumber * mark;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * session;
@property (nonatomic, retain) NSString * subjectCode;
@property (nonatomic, retain) NSSet *assessmentRelationship;
@property (nonatomic, retain) NSSet *classesRelationship;
@end

@interface Subjects (CoreDataGeneratedAccessors)

- (void)addAssessmentRelationshipObject:(Assessments *)value;
- (void)removeAssessmentRelationshipObject:(Assessments *)value;
- (void)addAssessmentRelationship:(NSSet *)values;
- (void)removeAssessmentRelationship:(NSSet *)values;

- (void)addClassesRelationshipObject:(Classes *)value;
- (void)removeClassesRelationshipObject:(Classes *)value;
- (void)addClassesRelationship:(NSSet *)values;
- (void)removeClassesRelationship:(NSSet *)values;

@end
