//
//  CollapsibleTabBar.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 19.12.24.
//

import SwiftUI

struct CollapsibleTabBar: View {
    @Binding var isCollapsed: Bool
    @Binding var selectedTab: Int
    
    let tabs: [TabItem]
    
    var body: some View {
        HStack(spacing: SizeMetrics.tabSpacing) {
            ForEach(tabs.indices, id: \.self) { index in
                TabBarButton(
                    tab: tabs[index],
                    isSelected: selectedTab == index,
                    isCollapsed: isCollapsed
                ) {
                    selectedTab = index
                }
            }
        }
        .padding(.horizontal, SizeMetrics.xlargePadding)
        .padding(.vertical, isCollapsed ? SizeMetrics.verticalPaddingCollapsed : SizeMetrics.verticalPaddingExpanded)
        .background(Color.white)
        .padding(.bottom, SizeMetrics.bottomPadding)
        .animation(.easeInOut, value: selectedTab)
    }
}

struct TabBarButton: View {
    let tab: TabItem
    let isSelected: Bool
    let isCollapsed: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: SizeMetrics.tabIconSpacing) {
                Image(systemName: tab.icon)
                    .font(.system(size: SizeMetrics.tabIconSize))
                    .foregroundColor(isSelected ? .primaryPurple : .gray)
                
                if isSelected && !isCollapsed {
                    Text(tab.title)
                        .foregroundColor(.primaryPurple)
                        .font(.system(size: 14, weight: .medium))
                        .transition(.opacity.combined(with: .slide))
                }
            }
            .padding(.horizontal, SizeMetrics.smallPadding)
            .padding(.vertical, SizeMetrics.smallPadding)
            .background(isSelected ? .lavenderBg : Color.clear)
            .cornerRadius(SizeMetrics.largeRadius)
        }
    }
}

struct TabItem {
    let icon: String
    let title: String
}


#Preview {
    @State var previewIsCollapsed: Bool = false
    @State var previewSelectedTab: Int = 0
    
    let previewTabs = [
        TabItem(icon: "house", title: "Home"),
        TabItem(icon: "circle.grid.cross", title: "Explore"),
        TabItem(icon: "bookmark", title: "Saved"),
        TabItem(icon: "waveform", title: "Music")
    ]
    
    return Group {
        CollapsibleTabBar(
            isCollapsed: $previewIsCollapsed,
            selectedTab: $previewSelectedTab,
            tabs: previewTabs
        )
        .previewDisplayName("Expanded")
        
        CollapsibleTabBar(
            isCollapsed: .constant(true),
            selectedTab: $previewSelectedTab,
            tabs: previewTabs
        )
        .previewDisplayName("Collapsed")
    }
}

