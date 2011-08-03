//
//  D.h
//  DeletingObjectsFromCoreData
//
//  Created by Pawel Nuzka on 8/3/11.
//  Copyright (c) 2011 PWR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface D : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* e;

@end
