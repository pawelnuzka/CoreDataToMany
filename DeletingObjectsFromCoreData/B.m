//
//  B.m
//  DeletingObjectsFromCoreData
//
//  Created by Pawel Nuzka on 8/4/11.
//  Copyright (c) 2011 PWR. All rights reserved.
//

#import "B.h"
#import "A.h"
#import "C.h"


@implementation B
@dynamic name;
@dynamic a;
@dynamic c;

- (void)addAObject:(A *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"a" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"a"] addObject:value];
    [self didChangeValueForKey:@"a" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeAObject:(A *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"a" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"a"] removeObject:value];
    [self didChangeValueForKey:@"a" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addA:(NSSet *)value {    
    [self willChangeValueForKey:@"a" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"a"] unionSet:value];
    [self didChangeValueForKey:@"a" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeA:(NSSet *)value {
    [self willChangeValueForKey:@"a" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"a"] minusSet:value];
    [self didChangeValueForKey:@"a" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
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
