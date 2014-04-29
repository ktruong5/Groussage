//
//  GroupDetailViewController.m
//  Groussage
//
//  Created by KT on 4/27/14.
//  Copyright (c) 2014 Groussage. All rights reserved.
//

#import "GroupDetailViewController.h"
#import "GroupTableViewController.h"
#import "GroupAdd.h"

@interface GroupDetailViewController ()


@end

@implementation GroupDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    // Do any additional setup after loading the view.
   // _gNameLabel.text = _groupDetailModel.;
//    _gDescLabel.text = _groupDetailModel[1];
//    _gImageView.image = [UIImage imageNamed:_groupDetailModel[2]];
    
    [self configureView];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)setDetailItem:(id)newDetailItem{

    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        [self configureView];
        
    }
    
}

-(void)configureView{
    if(self.detailItem){
        self.gNameLabel.text = [self.detailItem groupName];
        
    }

}

@end
