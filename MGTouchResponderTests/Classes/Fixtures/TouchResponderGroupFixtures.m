/*
 * Copyright (c) 2012 Mattes Groeger
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "MGTouchResponderGroup.h"
#import "MGTouchResponder.h"
#import "TouchResponderGroupFixtures.h"

@implementation ResponderIgnoreOnEnded
@synthesize callIndex = _callIndex;


- (void)setTouchResponderCallback:(id <MGTouchResponderCallback>)callback
{
	_touchResponderCallback = callback;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	_callIndex = CALL_COUNT++;
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	[_touchResponderCallback touchIgnored:self];
}

@end

@implementation ResponderIgnoreOnBegin

- (void)setTouchResponderCallback:(id <MGTouchResponderCallback>)callback
{
	_touchResponderCallback = callback;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	[_touchResponderCallback touchIgnored:self];
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	// ignore
}

@end

@implementation ResponderMinimal

- (void)setTouchResponderCallback:(id <MGTouchResponderCallback>)callback
{
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
}

@end

@implementation ResponderSetDataAndIgnore

- (void)setTouchResponderCallback:(id <MGTouchResponderCallback>)callback
{
	_touchResponderCallback = callback;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	_touchResponderCallback.userInfo[@"foo"] = @"bar";
	[_touchResponderCallback touchIgnored:self];
}

@end