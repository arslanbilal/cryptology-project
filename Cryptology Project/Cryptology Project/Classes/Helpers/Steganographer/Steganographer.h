//
//  Steganographer.h
//  Cryptology Project
//
//  Created by Bilal Arslan on 16/05/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Steganographer : NSObject

@property (nonatomic) NSUInteger messageSize;

- (NSString *)decodeMessage:(UIImage *)img;
- (UIImage *)encodeMessage:(UIImage *)img :(NSString *)message;

@end
