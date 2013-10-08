//
//  Subjects.h
//  studentHelperApp
//
//  Created by cs321kw1a on 3/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Subject : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * subjectCode;
@property (nonatomic, retain) NSString * session;
@property (nonatomic, retain) NSNumber * creditPoints;
@property (nonatomic, retain) NSNumber * mark;
@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSSet *assessmentRelationship;
@property (nonatomic, retain) NSSet *classesRelationship;
@end

@interface Subject (CoreDataGeneratedAccessors)

- (void)addAssessmentRelationshipObject:(NSManagedObject *)value;
- (void)removeAssessmentRelationshipObject:(NSManagedObject *)value;
- (void)addAssessmentRelationship:(NSSet *)values;
- (void)removeAssessmentRelationship:(NSSet *)values;

- (void)addClassesRelationshipObject:(NSManagedObject *)value;
- (void)removeClassesRelationshipObject:(NSManagedObject *)value;
- (void)addClassesRelationship:(NSSet *)values;
- (void)removeClassesRelationship:(NSSet *)values;

@end
