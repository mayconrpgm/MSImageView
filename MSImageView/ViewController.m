//
//  ViewController.m
//  MSImageView
//
//  Created by Maycon Queiros on 04/09/12.
//  Copyright (c) 2012 Maycon Queiros. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _imageView = [[MSImageView alloc] initWithFrame:CGRectMake(61, 49, 200, 200)];
    [self.view addSubview:_imageView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)loadImage:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            [_imageView loadImageFromURL:[NSURL URLWithString:@"http://1.bp.blogspot.com/__GR2CBCdWDk/SWzGOnLsvHI/AAAAAAAAIb4/cQZZg1cTrl4/s400/Natureza%2B-%2BLindas%2Bimagens%2B10.jpg"] animated:YES placeholderImage:[UIImage imageNamed:@"placeholder.gif"]];
            
            break;
        case 2:
            [_imageView loadImageFromURL:[NSURL URLWithString:@"http://www.letsgodigital.org/images/artikelen/35/d90-test-photo.jpg"] animated:YES placeholderImage:[UIImage imageNamed:@"placeholder.gif"]];
            break;
        case 3:
            [_imageView loadImageFromURL:[NSURL URLWithString:@"http://www.apolo11.com/imagens/2010/cometa_hartley_2_missao_epoxy.jpg"] animated:YES placeholderImage:[UIImage imageNamed:@"placeholder.gif"]];
            break;
    }
}

@end
