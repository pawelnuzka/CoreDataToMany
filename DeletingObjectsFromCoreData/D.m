//
//  D.m
//  DeletingObjectsFromCoreData
//
//  Created by Pawel Nuzka on 8/3/11.
//  Copyright (c) 2011 PWR. All rights reserved.
//

#import "D.h"


@implementation D
@dynamic name;
@dynamic e;

- (void)addEObject:(NSManagedObject *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"e" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"e"] addObject:value];
    [self didChangeValueForKey:@"e" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeEObject:(NSManagedObject *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"e" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"e"] removeObject:value];
    [self didChangeValueForKey:@"e" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addE:(NSSet *)value {    
    [self willChangeValueForKey:@"e" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"e"] unionSet:value];
    [self didChangeValueForKey:@"e" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeE:(NSSet *)value {
    [self willChangeValueForKey:@"e" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"e"] minusSet:value];
    [self didChangeValueForKey:@"e" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
