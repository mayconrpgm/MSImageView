//
//  MSImageView.m
//  MSImageView
//
//  Created by Maycon Queiros on 04/09/12.
//  Copyright (c) 2012 Maycon Queiros. All rights reserved.
//

#import "MSImageView.h"

@implementation MSImageView {
    NSString *_actualThreadLabelString;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)loadImageFromURL:(NSURL *)url animated:(BOOL)animated placeholderImage:(UIImage *)placeholder {
    self.image = placeholder;
    _actualThreadLabelString = [url absoluteString];
    
    dispatch_queue_t loadImageQueue = dispatch_queue_create([[url absoluteString] cStringUsingEncoding:NSUTF8StringEncoding], NULL);
    
    dispatch_async(loadImageQueue, ^(void){
        //carrega imagem da url
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        
        if(!strcmp(dispatch_queue_get_label(loadImageQueue), [_actualThreadLabelString cStringUsingEncoding:NSUTF8StringEncoding])) {
            //Atualiza imagem na main thread
            dispatch_sync(dispatch_get_main_queue(), ^(void){
                if (animated) {
                    [UIView animateWithDuration:.3
                                     animations:^(void){
                                         self.alpha = .0;
                                     }
                                     completion:^(BOOL finished){
                                         self.image = image;
                                         [UIView animateWithDuration:.3 animations:^(void){
                                             self.alpha = 1.0;
                                         }];
                                     }];
                }
                else {
                    self.image = image;
                }
            });
        }
        else {
            NSLog(@"Thread with label '%s' ignored.", dispatch_queue_get_label(loadImageQueue));
        }
    });
}

@end
