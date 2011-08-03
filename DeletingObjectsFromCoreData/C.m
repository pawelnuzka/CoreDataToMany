//
//  C.m
//  DeletingObjectsFromCoreData
//
//  Created by Pawel Nuzka on 8/4/11.
//  Copyright (c) 2011 PWR. All rights reserved.
//

#import "C.h"
#import "A.h"
#import "B.h"
#import "D.h"


@implementation C
@dynamic name;
@dynamic a;
@dynamic d;
@dynamic b;


- (void)addDObject:(D *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"d" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"d"] addObject:value];
    [self didChangeValueForKey:@"d" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeDObject:(D *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"d" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"d"] removeObject:value];
    [self didChangeValueForKey:@"d" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addD:(NSSet *)value {    
    [self willChangeValueForKey:@"d" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"d"] unionSet:value];
    [self didChangeValueForKey:@"d" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeD:(NSSet *)value {
    [self willChangeValueForKey:@"d" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"d"] minusSet:value];
    [self didChangeValueForKey:@"d" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


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


@end
