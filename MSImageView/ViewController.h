//
//  ViewController.h
//  MSImageView
//
//  Created by Maycon Queiros on 04/09/12.
//  Copyright (c) 2012 Maycon Queiros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSImageView.h"

@interface ViewController : UIViewController {
    MSImageView *_imageView;
}

- (IBAction)loadImage:(UIButton *)sender;

@end
