//
//  A.m
//  DeletingObjectsFromCoreData
//
//  Created by Pawel Nuzka on 8/4/11.
//  Copyright (c) 2011 PWR. All rights reserved.
//

#import "A.h"
#import "B.h"
#import "C.h"


@implementation A
@dynamic name;
@dynamic b;
@dynamic c;

- (void)addBObject:(B *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"b" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"b"] addObject:value];
    [self didChangeValueForKey:@"b" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeBObject:(B *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"b" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"b"] removeObject:value];
    [self didChangeValueForKey:@"b" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addB:(NSSet *)value {    
    [self willChangeValueForKey:@"b" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"b"] unionSet:value];
    [self didChangeValueForKey:@"b" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeB:(NSSet *)value {
    [self willChangeValueForKey:@"b" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"b"] minusSet:value];
    [self didChangeValueForKey:@"b" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


- (void)addCObject:(C *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"c" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"c"] addObject:value];
    [self didChangeValueForKey:@"c" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeCObject:(C *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"c" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"c"] removeObject:value];
    [self didChangeValueForKey:@"c" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addC:(NSSet *)value {    
    [self willChangeValueForKey:@"c" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"c"] unionSet:value];
    [self didChangeValueForKey:@"c" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeC:(NSSet *)value {
    [self willChangeValueForKey:@"c" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"c"] minusSet:value];
    [self didChangeValueForKey:@"c" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
