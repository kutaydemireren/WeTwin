//
//  CustomTabBar.swift
//  Wetwin
//
//  Created by Kutay Demireren on 01/12/15.
//  Copyright © 2015 Kutay Demireren. All rights reserved.
//

extension UIImage {
    func makeImageWithColorAndSize(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRectMake(0, 0, size.width, size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIImage {
    func imageWithColor(tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        let context = UIGraphicsGetCurrentContext()! as CGContextRef
        CGContextTranslateCTM(context, 0, self.size.height)
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextSetBlendMode(context, CGBlendMode.Normal)
        
        let rect = CGRectMake(0, 0, self.size.width, self.size.height) as CGRect
        CGContextClipToMask(context, rect, self.CGImage)
        tintColor.setFill()
        CGContextFillRect(context, rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext() as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

class CustomTabBar: UITabBarController {
    @IBInspectable var defaultIndex: Int = 0
    @IBInspectable var tintColor: UIColor = UIColor.whiteColor()
    @IBInspectable var rectColor: UIColor = UIColor.whiteColor()

    override func viewDidLoad() {
        super.viewDidLoad()
        //Specify predefined storyboard preferences.
        selectedIndex = defaultIndex
        tabBar.tintColor = tintColor
        
        //Creates a rect around a selected tab.
      tabBar.selectionIndicatorImage = UIImage().makeImageWithColorAndSize(rectColor, size: CGSizeMake(tabBar.frame.width/CGFloat(tabBar.items!.count), tabBar.frame.height))
        
        //Make items without second unselected tint colors' white, and second's red.
        for item in tabBar.items! as [UITabBarItem] {
            if (item != tabBar.items![2]) {
                let image = item.image
                item.image = image!.imageWithColor(UIColor.whiteColor()).imageWithRenderingMode(.AlwaysOriginal)
            }else{
                tabBar.items![2].image = tabBar.items![2].image!.imageWithColor(UIColor.whiteColor()).imageWithRenderingMode(.AlwaysOriginal)
            }
        }
        
    }
}
