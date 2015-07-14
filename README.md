# CatZanButton

# Introduction

CatZanButton is easy to create a zan button with cool animation

# ScreenRecords
![ScreenShots1](https://raw.githubusercontent.com/K-cat/CatZanButton/master/ScreenRecord.gif)

# Installation

CatZanButton is available on [CocoaPods](http://cocoapods.org).Just add the following to your project Podfile:
```ruby
pod 'CatZanButton'
```

#Usage

```objective-c
#import "CatZanButton"

CatZanButton *zanBtn=[[CatZanButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50) zanImage:[UIImage imageNamed:@"Zan"] unZanImage:[UIImage imageNamed:@"UnZan"]];
[zanBtn setCenter:self.view.center];
[self.view addSubview:zanBtn];

```
