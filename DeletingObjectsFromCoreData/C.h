//
//  C.h
//  DeletingObjectsFromCoreData
//
//  Created by Pawel Nuzka on 8/4/11.
//  Copyright (c) 2011 PWR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class A, B, D;

@interface C : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) A * a;
@property (nonatomic, retain) NSSet* d;
@property (nonatomic, retain) NSSet* b;

@end
