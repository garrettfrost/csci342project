//
//  Session.m
//  studentHelperApp
//
//  Created by Ryan Toohey on 27/10/13.
//  Copyright (c) 2013 gf99rjda640. All rights reserved.
//

#import "Session.h"

@implementation Session

-(id) init {
    self = [super init];
    
    if(self)
    {
        self.sessionName = [[NSString alloc]init];
    }
    
    return self;
}

@end
