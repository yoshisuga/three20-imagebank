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

@synthesize selectionView,checkmarkImageView;

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    self.backgroundColor = TTSTYLEVAR(thumbnailBackgroundColor);
    self.clipsToBounds = YES;
    [self setStylesWithSelector:@"thumbView:"];
    self.selectionView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    self.selectionView.backgroundColor = [UIColor whiteColor];
    self.selectionView.alpha = .5f;
      self.selectionView.userInteractionEnabled = NO;
    self.selectionView.hidden = YES;
    [self addSubview:selectionView];
    self.checkmarkImageView = [[[UIImageView alloc] initWithFrame:CGRectZero] autorelease];
    self.checkmarkImageView.image = [UIImage imageNamed:@"checkmark.png"];
      self.checkmarkImageView.userInteractionEnabled = NO;
    self.checkmarkImageView.hidden = YES;
    [self addSubview:self.checkmarkImageView];
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
