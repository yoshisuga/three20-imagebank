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

#import "Three20UI/TTThumbView.h"

// Style
#import "Three20Style/TTGlobalStyle.h"
#import "Three20Style/TTDefaultStyleSheet.h"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TTThumbView

@synthesize selectionView,checkmarkImageView, gifLabel;

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    self.backgroundColor = TTSTYLEVAR(thumbnailBackgroundColor);
    self.clipsToBounds = YES;
    [self setStylesWithSelector:@"thumbView:"];
    self.selectionView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    self.selectionView.backgroundColor = [UIColor whiteColor];
    self.selectionView.alpha = .3f;
      self.selectionView.userInteractionEnabled = NO;
    self.selectionView.hidden = YES;
    [self addSubview:selectionView];
    self.checkmarkImageView = [[[UIImageView alloc] initWithFrame:CGRectZero] autorelease];
    self.checkmarkImageView.image = [[UIImage imageNamed:@"checkmark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
      self.checkmarkImageView.tintColor = [UIColor redColor];
      self.checkmarkImageView.userInteractionEnabled = NO;
    self.checkmarkImageView.hidden = YES;
    [self addSubview:self.checkmarkImageView];
      UIFont *font = [UIFont boldSystemFontOfSize:9.0f];
      self.gifLabel = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
      self.gifLabel.opaque = NO;
      self.gifLabel.font = font;
      self.gifLabel.numberOfLines = 1;
      self.gifLabel.textAlignment = NSTextAlignmentLeft;
      self.gifLabel.textColor = [UIColor whiteColor];
      self.gifLabel.backgroundColor = [UIColor clearColor];
      self.gifLabel.alpha = 0.7f;
      self.gifLabel.text = @"GIF";
      self.gifLabel.hidden = YES;
      CGSize textSize = [self.gifLabel.text sizeWithFont:font];
      CGRect textFrame = CGRectMake(5.0f, 5.0f, textSize.width, textSize.height);
      self.gifLabel.frame = textFrame;
      [self addSubview:self.gifLabel];
  }

  return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
-(void)dealloc {
    [selectionView release];
    [checkmarkImageView release];
    [super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Properties


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)thumbURL {
  return [self imageForState:UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setThumbURL:(NSString*)URL {
  [self setImage:URL forState:UIControlStateNormal];
}


@end
