//
//  GroupAddViewController.m
//  Groussage
//
//  Created by KT on 4/27/14.
//  Copyright (c) 2014 Groussage. All rights reserved.
//

#import "GroupAddViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface GroupAddViewController ()

@property BOOL newImage;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
- (IBAction)chooseFromLibrary:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imagePreview;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation GroupAddViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    //See whether done button was tapped
    if(sender != self.doneButton) return;
    
    if (self.nameField.text.length > 0) {

        self.groupAddition = [[GroupAdd alloc]init];
        self.groupAddition.groupName = self.nameField.text;
        self.groupAddition.groupDescription = self.descriptionField.text;
        self.groupAddition.groupImage = _imagePreview.image;
        
    }
}


- (IBAction)chooseFromLibrary:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        //imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker
                           animated:YES completion:nil];
        _newImage = NO;
    }
    

}






-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        _imagePreview.image = info[UIImagePickerControllerOriginalImage];
        
        
        
        
        if (_newImage)
            UIImageWriteToSavedPhotosAlbum(_imagePreview.image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        // Code here to support video if enabled
    }
}

-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
