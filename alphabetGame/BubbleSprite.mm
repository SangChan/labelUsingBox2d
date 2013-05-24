//
//  BubbleSprite.m
//  alphabetGame
//
//  Created by SangChan Lee on 13. 5. 24..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//

#import "BubbleSprite.h"


@implementation BubbleSprite

@synthesize body = body_;

+(id)spriteWithFile:(NSString*)filename Label:(NSString*)label {

	return [[[self alloc] initWithFile:filename Label:label] autorelease];
}
-(id)initWithFile:(NSString *)filename Label:(NSString*)label {
    self = [super initWithFile:filename];
    CCLabelTTF *addedLabel = [CCLabelTTF labelWithString:label fontName:@"Marker Felt" fontSize:48];
    addedLabel.position = ccp(self.position.x+31,self.position.y+31);
    [self addChild:addedLabel];
    return self;
}

-(void) setPhysicsBody:(b2Body *)body
{
	body_ = body;
}

// this method will only get called if the sprite is batched.
// return YES if the physics values (angles, position ) changed
// If you return NO, then nodeToParentTransform won't be called.
-(BOOL) dirty
{
	return YES;
}

// returns the transform matrix according the Chipmunk Body values
-(CGAffineTransform) nodeToParentTransform
{
	b2Vec2 pos  = body_->GetPosition();
	
	float x = pos.x * PTM_RATIO;
	float y = pos.y * PTM_RATIO;
	
	if ( ignoreAnchorPointForPosition_ ) {
		x += anchorPointInPoints_.x;
		y += anchorPointInPoints_.y;
	}
	
	// Make matrix
	float radians = body_->GetAngle();
	float c = cosf(radians);
	float s = sinf(radians);
	
	if( ! CGPointEqualToPoint(anchorPointInPoints_, CGPointZero) ){
		x += c*-anchorPointInPoints_.x + -s*-anchorPointInPoints_.y;
		y += s*-anchorPointInPoints_.x + c*-anchorPointInPoints_.y;
	}
	
	// Rot, Translate Matrix
	transform_ = CGAffineTransformMake( c,  s,
									   -s,	c,
									   x,	y );
	
	return transform_;
}


-(void) dealloc
{
	//
    [super dealloc];
}


@end
