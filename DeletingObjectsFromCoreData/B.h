//
//  B.h
//  DeletingObjectsFromCoreData
//
//  Created by Pawel Nuzka on 8/4/11.
//  Copyright (c) 2011 PWR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class A, C;

@interface B : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* a;
@property (nonatomic, retain) NSSet* c;

@end
