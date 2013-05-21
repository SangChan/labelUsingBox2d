//
//  PhysicsLabel.h
//  alphabetGame
//
//  Created by SangChan Lee on 13. 5. 21..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "Box2D.h"

@interface PhysicsLabel : CCLabelTTF {
    b2Body *body_;	// strong ref
}
-(void) setPhysicsBody:(b2Body*)body;

@end
