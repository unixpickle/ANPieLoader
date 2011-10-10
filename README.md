ANPieLoader
===========

ANPieLoader is a simple <tt>UIView</tt> subclass for indicating a task's progress through a pie chart UI. It allows custom pie and border colors, as well as the customization of border size and padding. With all of these great features, why *wouldn't* you use ANPieLoader?

Screenshots
===========
|                                        Square                                      |                                       Circle                                       |
|:-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------:|
| ![Example square](https://github.com/unixpickle/ANPieLoader/raw/master/square.png) | ![Example circle](https://github.com/unixpickle/ANPieLoader/raw/master/circle.png) |

Sample Code
===========

Get started by creating a new ANPieLoader, and adding it to your view:

	loadingBar = [(ANPieLoader *)[ANPieLoader alloc] initWithFrame:CGRectMake(10, 10, 300, 300)
	                                                         style:ANPieLoaderStyleRounded];
	[loadingBar setBorderWidth:4];
	[loadingBar setBorderPadding:3];
	[loadingBar setProgress:0.83];
	[self.view addSubview:loadingBar];

Change the progress with ```[loadingBar setProgress:x]```, and even animate a progress change as follows:

	[loadingBar moveToProgress:x duration:0.5];

License
=======

	Copyright (c) 2011-2012 Alex Nichol
	All rights reserved.

	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions
	are met:
	1. Redistributions of source code must retain the above copyright
	   notice, this list of conditions and the following disclaimer.
	2. Redistributions in binary form must reproduce the above copyright
	   notice, this list of conditions and the following disclaimer in the
	   documentation and/or other materials provided with the distribution.
	3. The name of the author may not be used to endorse or promote products
	   derived from this software without specific prior written permission.

	THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
	IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
	OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
	IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
	INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
	NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
	DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
	THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
	THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Donation
--------

This software was written by Alex Nichol, a freelance Objective-C developer. Donations can be made on [his personal website](http://aqnichol.com/new/donate.php).
