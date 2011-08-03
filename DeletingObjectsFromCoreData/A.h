//
//  A.h
//  DeletingObjectsFromCoreData
//
//  Created by Pawel Nuzka on 8/4/11.
//  Copyright (c) 2011 PWR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class B, C;

@interface A : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* b;
@property (nonatomic, retain) NSSet* c;

@end
