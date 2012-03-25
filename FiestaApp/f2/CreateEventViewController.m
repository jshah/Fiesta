//
//  CreateEventViewController.m
//  f2
//
//  Created by Meenal Tambe on 3/13/12.
//  Copyright (c) 2012 Fiesta. All rights reserved.
//

#import "CreateEventViewController.h"
#define kOFFSET_FOR_KEYBOARD -150;

@implementation CreateEventViewController
@synthesize title;
@synthesize address;
@synthesize date;
@synthesize time;
@synthesize description;
@synthesize currentEvent;
@synthesize flag;
bool stayup;

-(void)setViewMovedUp:(BOOL)movedUp
{/*
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    CGRect rect = self.description.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard 
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        
        if (rect.origin.y == 0 ) {
            rect.origin.y -= kOFFSET_FOR_KEYBOARD;
            //rect.size.height += kOFFSET_FOR_KEYBOARD;
        }
        
    }
    else
    {
        if (stayup == NO) {
            rect.origin.y += kOFFSET_FOR_KEYBOARD;
            //rect.size.height -= kOFFSET_FOR_KEYBOARD;
        }
    }
    self.description.frame = rect; 
    [UIView commitAnimations];*/
}


- (void)keyboardWillHide:(NSNotification *)notif {
    [self setViewMovedUp:NO];
}


- (void)keyboardWillShow:(NSNotification *)notif{
    [self setViewMovedUp:YES];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    stayup = YES;
    [self setViewMovedUp:YES];
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    stayup = NO;
    [self setViewMovedUp:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) 
                                                 name:UIKeyboardWillShowNotification object:self.view.window];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) 
                                                 name:UIKeyboardWillHideNotification object:self.view.window];
}

- (void)viewWillDisappear:(BOOL)animated
{
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
  //  self.originalCenter = self.view.center;
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    //[self setresults:nil];
    [self setTitle:nil];
    [self setAddress:nil];
    [self setDate:nil];
    [self setDescription:nil];
	[self setDate:nil];
	[self setTime:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/*- (IBAction)time:(id)sender {
    UISegmentedControl *time = sender;
    if( time.selectedSegmentIndex == 0) {
        flag = 0;
        /*UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Enter the Date"
                                                          message:nil
                                                         delegate:self 
                                                cancelButtonTitle:@"Cancel" 
                                                otherButtonTitles:@"OK", nil];
        
        [message setAlertViewStyle:UIAlertViewStylePlainTextInput];
        
        [message show];
        UITextField *textField; 
        
        UIAlertView *prompt2 = [[UIAlertView alloc] initWithTitle:@"Enter Date:"               
                                                         message:@"MEENALDRINKSLOTSACOFFEE" //I need this for positioning lol         
                                                        delegate:nil              
                                               cancelButtonTitle:@"Cancel"             
                                               otherButtonTitles:@"OK", nil];
        
        textField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 50.0, 260.0, 25.0)];  
        [textField setBackgroundColor:[UIColor whiteColor]]; 
        [textField setPlaceholder:@"MM/DD/YYYY"];
        [prompt2 addSubview:textField];
        [prompt2 show];    
        [textField becomeFirstResponder];
    
        //NSLog(@"First Segment Selected");
    }
    if( time.selectedSegmentIndex == 1) {
        flag = 1;
      /*  UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Enter the Time"
                                                          message:nil
                                                         delegate:self 
                                                cancelButtonTitle:@"Cancel" 
                                                otherButtonTitles:@"OK", nil];
        
        [message setAlertViewStyle:UIAlertViewStylePlainTextInput];
        
        [message show];
        //NSLog(@"Second Segment Selected");
    }
        UITextField *textField2;
        
        UIAlertView *prompt = [[UIAlertView alloc] initWithTitle:@"Enter Time:"               
                                                        message:@"WTFISINTHISCOFFEE" //I need this for poisitioning lol         
                                                        delegate:nil              
                                               cancelButtonTitle:@"Cancel"             
                                               otherButtonTitles:@"OK", nil];
                               
        textField2 = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 50.0, 260.0, 25.0)];  
        [textField2 setBackgroundColor:[UIColor whiteColor]]; 
        [textField2 setPlaceholder:@"XX:XX AM/PM"];
        [prompt addSubview:textField2];
        [prompt show];    
        [textField2 becomeFirstResponder];
                               }
    
    
        
}

/*-(void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.description.frame = CGRectMake(0, 0, 320, 400);
    [UIView commitAnimations]; 
}*/

/*- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    int animatedDistance;
    int moveUpValue = textField.frame.origin.y+ textField.frame.size.height;
    UIInterfaceOrientation orientation =
    [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        
        animatedDistance = 216-(460-moveUpValue-5);
    }
    else
    {
        animatedDistance = 162-(320-moveUpValue-5);
    }
    
    if(animatedDistance>0)
    {
        const int movementDistance = animatedDistance;
        const float movementDuration = 0.3f; 
        int movement = (up ? -movementDistance : movementDistance);
        [UIView beginAnimations: nil context: nil];
        [UIView setAnimationBeginsFromCurrentState: YES];
        [UIView setAnimationDuration: movementDuration];
        self.view.frame = CGRectOffset(self.view.frame, 0, movement);       
        [UIView commitAnimations];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.description.frame = CGRectOffset(self.description.frame, 0, 100);
    [UIView commitAnimations]; 
    //[self animateTextField:description up:YES];
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    //[self animateTextField:description up:NO];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES; 
}*/


- (IBAction)hidekeyboard:(id)sender {
    [self.title resignFirstResponder];
    [self.address resignFirstResponder];
    [self.description resignFirstResponder]; 
	[self.date resignFirstResponder];
	[self.time resignFirstResponder];
}

- (IBAction)store:(id)sender {
    
    NSString *csvLine=[NSString stringWithFormat:@"%@ \n %@ \n %@ \n",
                       self.title.text,
                       self.address.text,
                       self.description.text];
    
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(
                                                            NSDocumentDirectory,
                                                            NSUserDomainMask, YES) 
                        objectAtIndex: 0];

    
  /*  NSString *storeevent = [docDir 
                            stringByAppendingPathComponent:
                            @"results2.csv"];
    
    if  (![[NSFileManager defaultManager] fileExistsAtPath:storeevent]) {
        [[NSFileManager defaultManager] 
         createFileAtPath:storeevent contents:nil attributes:nil];
    }
    
    NSFileHandle *fileHandle = [NSFileHandle 
                                fileHandleForUpdatingAtPath:storeevent];
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:[csvLine 
                           dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandle closeFile]; */
}

-(IBAction)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
	MenuViewAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
   // PFQuery *query = [PFQuery queryWithClassName:@"FiestaEvent"];
	
	
    currentEvent = [PFObject objectWithClassName: @"FiestaEvent"];
    [currentEvent setObject: self.title.text forKey: @"Title"];
    [currentEvent setObject: self.address.text forKey: @"Address"];
    [currentEvent setObject: self.description.text forKey: @"Description"];
	[currentEvent setObject: self.date.text forKey: @"Date"];
	[currentEvent setObject: self.time.text forKey: @"Time"];
	
	
	[currentEvent saveInBackground];
    [appDelegate insertObject];
	[appDelegate setFieldValue:currentEvent];
    
    NSLog(@"CurrentEvent ID: %@", [appDelegate getFieldValueAtPos]);
	//NSLog(@"CurrentEvent: %@", [currentEvent objectForKey:@"Title"]);
    
}



@end
