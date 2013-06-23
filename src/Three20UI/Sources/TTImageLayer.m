//
// Copyright 2009-2011 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "Three20UI/private/TTImageLayer.h"

// UI
#import "Three20UI/TTImageView.h"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TTImageLayer

@synthesize override = _override;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)display {
  if (nil != _override) {
      UIImage *image = _override.image;
      if ( [[image images] count] > 1) {
          // its an animated image, lets animate the layer!
          NSTimeInterval duration = [image duration];
          NSLog(@"its an animated image! duration: %f",duration);
          [CATransaction flush];
          [CATransaction begin];
          CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
          NSMutableArray *frames = [[[NSMutableArray alloc] init] autorelease];
          for (UIImage *frame in [image images]) {
              [frames addObject:(id)frame.CGImage];
          }
          animation.values = frames;
          animation.repeatCount = HUGE_VALF;
          animation.autoreverses = NO;
          animation.calculationMode = kCAAnimationDiscrete;
          animation.duration = duration;
          [animation setRemovedOnCompletion:NO];
          [self addAnimation:animation forKey:@"contents"];
          [CATransaction commit];
      } else {
          [self removeAllAnimations];
          self.contents = (id)_override.image.CGImage;
      }
    

  } else {
    return [super display];
  }
}


@end
