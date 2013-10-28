//
//  Classes.h
//  studentHelperApp
//
<<<<<<< HEAD
//  Created by cs321kw1a on 20/10/13.
=======
//  Created by cs321kw1a on 4/10/13.
>>>>>>> 6b506c976e0a13fb292fed003bada4e46250ded3
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Subjects;

@interface Classes : NSManagedObject

<<<<<<< HEAD
@property (nonatomic, retain) NSString * day;
@property (nonatomic, retain) NSString * session;
@property (nonatomic, retain) NSNumber * duration;
@property (nonatomic, retain) NSString * room;
@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * subjectCode;
=======
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) NSNumber * day;
@property (nonatomic, retain) NSString * room;
@property (nonatomic, retain) NSNumber * duration;
>>>>>>> 6b506c976e0a13fb292fed003bada4e46250ded3
@property (nonatomic, retain) Subjects *classOwnedBySubject;

@end
