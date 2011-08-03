//
//  E.h
//  DeletingObjectsFromCoreData
//
//  Created by Pawel Nuzka on 8/3/11.
//  Copyright (c) 2011 PWR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class D;

@interface E : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) D * d;

@end
