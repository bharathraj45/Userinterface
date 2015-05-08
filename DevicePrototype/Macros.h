//
//  Macros.h
//  Invent
//
//  Created by sgx on 05/01/13.
//  Copyright (c) 2013 __Solugenix__. All rights reserved.
//


//Macro to get color from hex value
#define UIColorFromRGBWithAlpha(rgbValue,a) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

//Macro to set style: font, tint color to bar button item
#define BarButtonItemStyle(barButtonItem) [barButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont boldSystemFontOfSize:18.0], NSFontAttributeName, UIColorFromRGBWithAlpha(0xffffff, 1.0), NSForegroundColorAttributeName, nil] forState:UIControlStateNormal]; [barButtonItem setTintColor:UIColorFromRGBWithAlpha(0x999999,0.3)];

#define BarButtonItemStyle_custom(barButtonItem) [barButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont boldSystemFontOfSize:20.0], NSFontAttributeName, UIColorFromRGBWithAlpha(0xffffff, 1.0), NSForegroundColorAttributeName, nil] forState:UIControlStateNormal]; [barButtonItem setTintColor:UIColorFromRGBWithAlpha(0x4185e0,0.5)];


//Set custom button style
#define ButtonStyle(button,rgbValue) [button setTitleColor:UIColorFromRGBWithAlpha(rgbValue, 1.0) forState:UIControlStateNormal];


//custom button

#define CustomButtonStyle(customButton,buttonTitle,tgMethod) [customButton setTitle:buttonTitle forState: UIControlStateNormal];[customButton setBackgroundColor: UIColorFromRGBWithAlpha(0x4185e0,1.0)];[customButton.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];customButton.layer.cornerRadius = 10;customButton.clipsToBounds = YES; [customButton addTarget: self action:tgMethod forControlEvents: UIControlEventTouchUpInside];






