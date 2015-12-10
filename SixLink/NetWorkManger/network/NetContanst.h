//
//  NetContanst.h
//  Ubankers
//
//  Created by 袁斌 on 15/11/5.
//  Copyright © 2015年 Rong An. All rights reserved.
//

#ifndef NetContanst_h
#define NetContanst_h

#import "AppDelegate.h"
#import "MBProgressHUD.h"

typedef NS_ENUM(NSInteger, UB_NetworkRequestSerializer) {
    
    UB_NetworkDefaultRequestSerializer = 0,        //default >>>>>AFJSONRequestSerializer
    
    UB_NetworkHTTPRequestSerializer,               //>>>>>AFHTTPRequestSerializer
    
    UB_NetworkJSONRequestSerializer,               //>>>>>AFJSONRequestSerializer
    
    UB_NetworkPropertyListRequestSerializer,       //>>>>>AFPropertyListRequestSerializer
    
};

typedef NS_ENUM(NSInteger, UB_NetworkResponseSerializer) {
    
    UB_NetworkDefaultResponseSerializer = 0,        //default >>>>>AFJSONResponseSerializer
    
    UB_NetworkHTTPResponseSerializer,               //>>>>>AFHTTPResponseSerializer
    
    UB_NetworkJSONResponseSerializer,               //>>>>>AFJSONResponseSerializer
    
    UB_NetworkPropertyListResponseSerializer,       //>>>>>AFPropertyListResponseSerializer
    
    UB_NetworkXMLParserResponseSerializer,          //>>>>>AFXMLParserResponseSerializer
    
    UB_NetworkImageResponseSerializer,              //>>>>>AFImageResponseSerializer
    
    UB_NetworkCompoundResponseSerializer,           //>>>>>AFCompoundResponseSerializer
    
};

typedef NS_ENUM(NSInteger, UB_ProgressHUDMode) {
    /** Progress is shown using an UIActivityIndicatorView. This is the default. */
    UB_ProgressHUDModeIndeterminate,
    /** Progress is shown using a round, pie-chart like, progress view. */
    UB_ProgressHUDModeDeterminate,
    /** Progress is shown using a horizontal progress bar */
    UB_ProgressHUDModeDeterminateHorizontalBar,
    /** Progress is shown using a ring-shaped progress view. */
    UB_ProgressHUDModeAnnularDeterminate,
    /** Shows a custom view */
    UB_ProgressHUDModeCustomView,
    /** Shows only labels */
    UB_ProgressHUDModeText
};
typedef enum {
    /** Opacity animation */
    UB_ProgressHUDAnimationFade,
    /** Opacity + scale animation */
    UB_ProgressHUDAnimationZoom,
    UB_ProgressHUDAnimationZoomOut = UB_ProgressHUDAnimationZoom,
    UB_ProgressHUDAnimationZoomIn
} UB_ProgressHUDAnimation;


#endif /* NetContanst_h */
