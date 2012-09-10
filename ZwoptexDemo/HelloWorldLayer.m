//
//  HelloWorldLayer.m
//  ZwoptexDemo
//
//  Created by Chen Weigang on 9/8/12.
//  Copyright Star Target 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

static CCSprite *mySprite = nil;

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
        
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"faces.plist"];
        mySprite = [CCSprite spriteWithSpriteFrameName:@"TXcaiyan@2x.png"];
        
        
        
        [self addChild:mySprite];
        mySprite.position = ccp(size.width/2, size.height/2);
        
        [self scheduleUpdateWithPriority:-10];
    
    }
	return self;
}


//[self scheduleUpdateWithPriority:-10];
-(void) update:(ccTime)deltaTime
{
    static ccTime timer = 0;
    static int index = 0;
    timer += deltaTime;
    if (timer>0.50) {
        timer = 0;
        index ++;
        index %= 65;
        NSString *strSprite = [NSString stringWithFormat:@"card_split_%d%d%d.png", index/100, index%100/10, index%10];
        [mySprite removeFromParentAndCleanup:YES];
        
        [[CCTextureCache sharedTextureCache] removeUnusedTextures];        
        [[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
        // 清理图片缓存
        [CCSpriteFrameCache purgeSharedSpriteFrameCache];
        [CCTextureCache purgeSharedTextureCache];
        
        mySprite = [CCSprite spriteWithFile:strSprite];
        
        [self addChild:mySprite];
		CGSize size = [[CCDirector sharedDirector] winSize];
        mySprite.position = ccp(size.width/2, size.height/2);
    }
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
