//
//  ViewController.m
//  ScrollView
//
//  Created by LLBER on 12/07/13.
//  Copyright (c) 2013 LLBER. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [[self scroller] setContentSize:[[self view] frame].size];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tecladoON:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tecladoOFF:) name:UIKeyboardWillHideNotification object:nil];
    UITapGestureRecognizer *touches = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [touches setCancelsTouchesInView:NO];
    [[self scroller] addGestureRecognizer:touches];

    [super viewDidLoad];

}
- (void)viewDidUnload {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    [super viewDidUnload];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self setTextFieldEnFoco:textField];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self setTextFieldEnFoco:nil];
}

    //Salida del teclado
- (void) tecladoON:(NSNotification *)teclado {
    NSDictionary *notificacion = [teclado userInfo];
    CGSize alturaKeyboard = [notificacion[UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets inserciones = UIEdgeInsetsMake(0, 0, alturaKeyboard.height, 0);
    [[self scroller] setContentInset:inserciones];
    [[self scroller] setScrollIndicatorInsets:inserciones];
    [[self scroller] scrollRectToVisible:[self TextFieldEnFoco].frame animated:YES];
}
    //Ocultación del teclado
- (void) tecladoOFF:(NSNotification *)animacion {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    UIEdgeInsets inserciones = UIEdgeInsetsZero;
    [[self scroller] setContentInset:inserciones];
    [[self scroller] setScrollIndicatorInsets:inserciones];
    [UIView commitAnimations];
}

- (void) dismiss {
    [[self view] endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
