//
//  Classes.h
//  studentHelperApp
//
//  Created by cs321kw1a on 4/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Subjects;

@interface Classes : NSManagedObject

@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) NSNumber * day;
@property (nonatomic, retain) NSString * room;
@property (nonatomic, retain) NSNumber * duration;
@property (nonatomic, retain) Subjects *classOwnedBySubject;

@end
