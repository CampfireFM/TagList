//
//  TagPresentables.swift
//  TagList
//
//  Created by 王继荣 on 16/12/2016.
//  Copyright © 2016 wonderbear. All rights reserved.
//

import UIKit

public struct TagPresentableText: TagPresentable {
    
    public private(set) var tag: String = ""
    public var isSelected: Bool = false
    private var onInit: ((TagContentText) -> Void)?
    
    public init(tag: String, onInit: ((TagContentText) -> Void)? = nil) {
        self.tag = tag
        self.onInit = onInit
    }
    
    public func createTagContent(color : UIColor) -> TagContent {
        let tagContent = TagContentText(tag: tag,color : color)
        onInit?(tagContent)
        return tagContent
    }
}

public struct TagPresentableIcon: TagPresentable {
    
    public private(set) var tag: String
    public private(set) var icon: String
    public private(set) var height: CGFloat
    public var isSelected: Bool = false
    private var onInit: ((TagContentIcon) -> Void)?
    
    public init(tag: String, icon: String, height: CGFloat, onInit: ((TagContentIcon) -> Void)? = nil) {
        self.tag = tag
        self.icon = icon
        self.height = height
        self.onInit = onInit
    }
    
    public func createTagContent(color : UIColor) -> TagContent {
        let tagContent = TagContentIcon(tag: tag, height: height, color : UIColor.green)
        tagContent.icon.image = UIImage(named: icon)
        onInit?(tagContent)
        return tagContent
    }
}


public struct TagPresentableIconText: TagPresentable {
    
    public private(set) var tag: String = ""
    public private(set) var icon: String = ""
    public var isSelected: Bool = false
    private var onInit: ((TagContentIconText) -> Void)?
    
    public init(tag: String, icon: String, onInit: ((TagContentIconText) -> Void)? = nil) {
        self.tag = tag
        self.icon = icon
        self.onInit = onInit
    }
    
    public func createTagContent(color : UIColor) -> TagContent {
        let tagContent = TagContentIconText(tag: tag,color: UIColor.green)
        tagContent.icon.image = UIImage(named: icon)
        onInit?(tagContent)
        return tagContent
    }
}
