//
//  BubbleSprite.h
//  alphabetGame
//
//  Created by SangChan Lee on 13. 5. 24..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"

@interface BubbleSprite : CCSprite {
    b2Body *body_;	// strong ref
    BOOL _poped;
}
@property (nonatomic ) b2Body *body;

+(id)spriteWithFile:(NSString *)filename Label:(NSString*)label;
-(id)initWithFile:(NSString *)filename Label:(NSString*)label;
@end
