//
//  OCMacro.h
//  meikejianzhi
//
//  Created by 戴伟来 on 16/1/5.
//  Copyright © 2016年 meike. All rights reserved.
//

#ifndef OCMacro_h
#define OCMacro_h
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]// rgb颜色转换（16进制->10进制）

#endif /* OCMacro_h */
