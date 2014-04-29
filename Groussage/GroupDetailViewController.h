//
//  GroupDetailViewController.h
//  Groussage
//
//  Created by KT on 4/27/14.
//  Copyright (c) 2014 Groussage. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GroupDetailViewController : UIViewController <UISplitViewControllerDelegate>


@property (strong, nonatomic) IBOutlet UILabel *gNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *gDescLabel;
@property (strong, nonatomic) IBOutlet UIImageView *gImageView;
@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) NSArray *groupDetailModel;


@end
