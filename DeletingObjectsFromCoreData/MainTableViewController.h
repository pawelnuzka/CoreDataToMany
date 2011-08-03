//
//  MainTableViewController.h
//  DeletingObjectsFromCoreData
//
//  Created by Pawel Nuzka on 8/3/11.
//  Copyright 2011 PWR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "A.h"
#import "B.h"
#import "C.h"
#import "D.h"
#import "E.h"

@interface MainTableViewController : UITableViewController <UINavigationControllerDelegate>{
    NSNumber *viewNumber;
    NSMutableArray *data;
    NSManagedObjectContext *context;
    NSManagedObject *currentEntity;
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
@property (nonatomic, retain) NSManagedObject *currentEntity;
@property (nonatomic, retain) NSManagedObjectContext *context;
@property (nonatomic, retain) NSMutableArray *data;
@property (nonatomic, retain) NSNumber *viewNumber;
@end
