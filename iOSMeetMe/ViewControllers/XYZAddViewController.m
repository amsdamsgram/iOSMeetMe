//
//  XYZAddViewController.m
//  iOSMeetMe
//
//  Created by Damien Soulard on 28/11/2013.
//  Copyright (c) 2013 Damien Soulard. All rights reserved.
//

#import "XYZAddViewController.h"

@interface XYZAddViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property (weak, nonatomic) IBOutlet UITextField *titleInput;
@property (weak, nonatomic) IBOutlet UITextField *nameInput;
@property (weak, nonatomic) IBOutlet UITextField *descInput;

@end

@implementation XYZAddViewController

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender == self.saveButton) {
        self.appt = [Appointment createEntity];
        
        self.appt = [self.appt initWithTitle:self.titleInput.text name:self.nameInput.text andDescription:self.descInput.text];
        
        [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
    }
}

@end
