//
//  GroupTableViewController.h
//  Groussage
//
//  Created by KT on 4/27/14.
//  Copyright (c) 2014 Groussage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *gImage;
@property (nonatomic, strong) NSArray *gName;
@property (nonatomic, strong) NSArray *gDesc;
@property NSMutableArray *groupList;

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@end
