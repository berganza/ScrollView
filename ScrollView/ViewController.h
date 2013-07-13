//
//  ViewController.h
//  ScrollView
//
//  Created by LLBER on 12/07/13.
//  Copyright (c) 2013 LLBER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>


@property (strong, nonatomic) UITextField *TextFieldEnFoco;
@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
@property (strong, nonatomic) IBOutlet UITextField *textField1;
@property (strong, nonatomic) IBOutlet UITextField *textField2;





@end
