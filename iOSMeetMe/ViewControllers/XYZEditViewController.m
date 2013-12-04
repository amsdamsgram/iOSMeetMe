//
//  XYZEditViewController.m
//  iOSMeetMe
//
//  Created by Damien Soulard on 30/11/2013.
//  Copyright (c) 2013 Damien Soulard. All rights reserved.
//

#import "XYZEditViewController.h"

@interface XYZEditViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property (weak, nonatomic) IBOutlet UITextField *titleInput;
@property (weak, nonatomic) IBOutlet UITextField *nameInput;
@property (weak, nonatomic) IBOutlet UITextField *descInput;

@end

@implementation XYZEditViewController

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
    [self configureView];
}

- (void)configureView
{
    if (self.appt) {
        self.titleInput.text = self.appt.title;
        self.nameInput.text = self.appt.name;
        self.descInput.text = self.appt.desc;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender == self.saveButton) {
        self.appt = [self.appt initWithTitle:self.titleInput.text name:self.nameInput.text andDescription:self.descInput.text];
        
        [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
    }
}

@end
