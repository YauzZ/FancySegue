//
//  FSFancyStoryboardSegue.m
//  FancySegue
//
//  Created by Chris Miles on 12/07/12.
//  Copyright (c) 2012 Chris Miles. All rights reserved.
//
//  MIT Licensed (http://opensource.org/licenses/mit-license.php):
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "FSFancyStoryboardSegue.h"

@interface FSFancyStoryboardSegue ()

@end


@implementation FSFancyStoryboardSegue

@synthesize transitionViewController = _transitionViewController;

- (void)perform
{
    if (nil == self.transitionViewController) {
	NSLog(@"WARNING: no transitionViewController provided to FSFancyStoryboardSegue");
	[self.sourceViewController presentViewController:self.destinationViewController animated:NO completion:NULL];
	return;
    }
    
    UIView *sourceView = [(UIViewController *)self.sourceViewController view];
    UIView *destinationView = [(UIViewController *)self.destinationViewController view];
    
    self.transitionViewController.sourceView = sourceView;
    self.transitionViewController.destinationView = destinationView;
    self.transitionViewController.fancyStoryboardSegueDelegate = self;
    
    [self.sourceViewController presentViewController:self.destinationViewController animated:NO completion:NULL];
    [self.destinationViewController presentViewController:self.transitionViewController animated:NO completion:NULL];
}

- (void)fancyStoryboardSegueTransitionFinished:(UIViewController *)viewController
{
    [self.transitionViewController dismissViewControllerAnimated:NO completion:^{
	self.transitionViewController = nil;
    }];
}

@end
